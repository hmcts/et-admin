ActiveAdmin.register UploadedFile, as: 'UploadedFiles' do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :file, :filename

  preserve_default_filters!
  remove_filter :file_attachment, :file_blob, :checksum

  show do
    attributes_table title: 'File Details' do
      row(:filename) { |f| link_to(f.filename, rails_blob_path(f.file, disposition: 'attachment')) }
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    id_column
    column :filename
    column :created_at
    column :content_type
  end

  form do |f|
    f.inputs do
      f.input :filename
      f.input :file, as: :file
    end
    f.actions

  end

end
