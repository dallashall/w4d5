require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
        setup { post :create, user: { username: "Dallas" } }
        it { should render_template(:new) }

        it { should set_flash }
    end

    context "with valid params" do
      setup { post :create, user: { username: "Dallas", password: "123456" } }
      it { should redirect_to(subs_url)}
    end
  end
end
