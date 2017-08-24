ActiveAdmin.register User do
  index do
    selectable_column
    column :id
    column :email
    column :full_name
    column :birth_date
    column :occupation
    column :phone_number
    column :created_at
    column :admin
    actions
  end

  form do |f|
    f.inputs "Identity" do
      f.input :full_name
      f.input :email
      f.input :occupation
      f.input :phone_number
      f.input :birth_date
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  permit_params :full_name, :email, :birth_date, :occupation, :phone_number, :admin
end
