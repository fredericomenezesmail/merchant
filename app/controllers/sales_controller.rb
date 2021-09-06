class SalesController < ApplicationController
  def new
    @sales = Sales.new
  end

  def create
  end
end
