class TemplatesController < ApplicationController

  def index
    # Column Information for GET /buy_posts
    @columns = [
        {name: "Category", id: :category},
        {name: "Post Type", id: :post_type},
        {name: "Column ID", id: :column_id},
        {name: "Column Name", id: :column_name},
        {name: "Datatype", id: :datatype},
    ]
    @templates = Template.all.order :post_type, :category
  end

  def new; end

  def create
    # POST only. /buy_posts
    template = Template.create! template_param
    if template.is_a? Template
      flash[:notice] = "#{template.category} - #{template.column_name} was successfully created."
    end
    redirect_to templates_path
  end

  def show
    @columns = [
        {name: "Category", id: :category},
        {name: "Post Type", id: :post_type},
        {name: "Column ID", id: :column_id},
        {name: "Column Name", id: :column_name},
        {name: "Datatype", id: :datatype},
    ]
    @template = Template.find(params[:id]) # look up post by unique ID
  end

  def edit
    @template = Template.find params[:id]
  end

  def update
    @template = Template.find params[:id]
    @template.update_attributes!(template_param)
    flash[:notice] = "Template '#{@template.category} - #{@template.column_name}' was successfully updated."
    redirect_to template_path(@template)
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    flash[:notice] = "Template '#{@template.category} - #{@template.column_name}' deleted."
    redirect_to templates_path
  end

  private

  def template_param
    params.require(:template).permit(:post_type, :category, :column_id, :column_name, :datatype)
  end

  def template_list
    templates = []
    params.require(:templates).each do |template|
      templates.append template.permit(:post_type, :category, :column_id, :column_name, :datatype)
    end
    templates
  end
end
