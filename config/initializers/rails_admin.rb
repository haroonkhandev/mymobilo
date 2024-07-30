RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.model 'Product' do
    edit do
      field :name

      field :specifications do
          field :specification_type, :enum do
            enum do
              Specification.specification_types.keys
            end
            label 'Specification Type'
          end

          # field :spec_attributes, :jsonb do
          #   label 'Attributes (JSON format)'
          #   help 'Enter attributes in JSON format, e.g., {"material": "Plastic", "dimensions": "10x5x2", "weight": "200g"}'
          # end
      end
    end
  end

  config.model 'Specification' do
    edit do
      field :specification_type, :enum do
        enum do
          Specification.specification_types.keys
        end
        label 'Specification Type'
      end

      field :spec_attributes, :jsonb do
        label 'Attributes (JSON format)'
        help 'Enter attributes in JSON format, e.g., {"material": "Plastic", "dimensions": "10x5x2", "weight": "200g"}'
      end
    end
  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
