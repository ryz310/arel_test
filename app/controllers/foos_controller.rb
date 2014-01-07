class FoosController < ApplicationController
  before_action :set_foo, only: [:show, :edit, :update, :destroy]

  # GET /foos
  # GET /foos.json
  def index

    puts "================================================================================"
    # ActiveRecord における Arel
    # 1. 自動的に 'select *' が付与される。
    # 3. 結合条件は model に記述した belongs_to, has_many 等から自動生成される
    puts Foo
          .joins(
            :bars)
          .to_sql
    # => SELECT "foos".* FROM "foos" INNER JOIN "bars" ON "bars"."foo_id" = "foos"."id"

    # arel_table における Arel
    # 1. .project で明示的に抽出カラムを指定する必要がある。
    # 3. 結合条件も明示的に指定する必要がある。
    foo = Foo.arel_table
    bar = Bar.arel_table
    puts foo
          .project(
            foo[Arel.star])
          .join(
            :bars)
          .on(
            bar[:foo_id].eq foo[:id])
          .to_sql
    # => SELECT "foos".* FROM "foos" INNER JOIN 'bars' ON "bars"."foo_id" = "foos"."id"

    puts "================================================================================"
    # ActiveRecord における　method名
    # 1. SELECT は　.select
    #    ※ INNER JOIN 等で複数のテーブルから取得している場合は arel_table でカラム名を指定する必要があるので注意。
    # 2. INNER JOIN は　.joins
    puts Foo
          .select(
            foo[:name],
            bar[:name])
          .joins(
            :bars)
          .to_sql
    # => SELECT "foos"."name", "bars"."name" FROM "foos" INNER JOIN "bars" ON "bars"."foo_id" = "foos"."id"
    
    # arel_table における　method名
    # 1. SELECT は　.project
    # 2. INNER JOIN は　.join
    puts foo
          .project(
            foo[:name],
            bar[:name])
          .join(
            :bars)
          .on(
            bar[:foo_id].eq foo[:id])
          .to_sql
    # => SELECT "foos"."name", "bars"."name" FROM "foos" INNER JOIN 'bars' ON "bars"."foo_id" = "foos"."id"
    puts "================================================================================"


    @foos = Foo.all
  end

  # GET /foos/1
  # GET /foos/1.json
  def show
  end

  # GET /foos/new
  def new
    @foo = Foo.new
  end

  # GET /foos/1/edit
  def edit
  end

  # POST /foos
  # POST /foos.json
  def create
    @foo = Foo.new(foo_params)

    respond_to do |format|
      if @foo.save
        format.html { redirect_to @foo, notice: 'Foo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @foo }
      else
        format.html { render action: 'new' }
        format.json { render json: @foo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foos/1
  # PATCH/PUT /foos/1.json
  def update
    respond_to do |format|
      if @foo.update(foo_params)
        format.html { redirect_to @foo, notice: 'Foo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @foo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foos/1
  # DELETE /foos/1.json
  def destroy
    @foo.destroy
    respond_to do |format|
      format.html { redirect_to foos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foo
      @foo = Foo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foo_params
      params.require(:foo).permit(:name)
    end
end
