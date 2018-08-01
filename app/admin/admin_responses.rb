ActiveAdmin.register Admin::Response, as: 'Responses' do
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

  index do
    selectable_column
    id_column
    column :reference
    column 'Respondent Name', :respondent_id do |r|
      r.respondent.name
    end
    column :case_number
    column :claimants_name
    column :created_at
    actions
  end

  filter :reference
  filter :case_number
  filter :created_at

end