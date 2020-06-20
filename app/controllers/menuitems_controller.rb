class MenuitemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    id = params[:id]
    @menuitem = Menuitem.find(id)
  end

  def show
    id = params[:id]
    @menuitem = Menuitem.find(id)
  end

  def new
    render "cart"
  end

  def create
    ensure_owner_logged_in

    menu_id = session[:current_menu_id]

    new_menuitem = Menuitem.new(name: params[:name],
                                description: params[:description],
                                price: params[:price],
                                menu_id: menu_id,
                                menuitem_id: params[:menuitem_id])
    if new_menuitem.save
      flash[:success] = "#{params[:name]} added to  menu!"
      redirect_to "/menus/#{menu_id}"
    else
      flash[:error] = new_menuitem.errors.full_messages.join(", ")
    end
  end

  def edit
    id = params[:id]
    menuitem = Menuitem.find(id)
    menus = Menu.displayable
    render "menu_item_edit", locals: { menuitem: menuitem, menus: menus }
  end

  def update
    id = params[:id]
    name = params[:name]
    menuitem = Menuitem.of_menu(current_menu).find(id)
    menuitem.name = name
    menuitem.save
    redirect_to menuitems_path
  end

  def updateMenuItem
    id = params[:id]
    menuitem = Menuitem.find(id)
    menuitem.name = params[:name]
    menuitem.description = params[:description]
    menuitem.price = params[:price]
    menuitem.menu_id = params[:menu_id]
    menuitem.save
    flash[:notice] = "updated successfully"
    redirect_to "/menus/#{menuitem.menu_id}"
  end

  def destroy
    id = params[:id]
    menuitem = Menuitem.find(id)
    menu_id = menuitem.menu_id
    menuitem.destroy
    redirect_to "/menus/#{menu_id}"
  end
end
