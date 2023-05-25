# frozen_string_literal: true
require 'fox16'
include Fox
require_relative 'tab_student'
require_relative 'tab_lab'
class Window<FXMainWindow
  def initialize(app)

    super(app, "Students" , :width => 1050, :height => 430)
    create_tabs
  end

  def create
    super
    @first_tab.refresh
    show
  end



  def create_tabs
    tab_book = FXTabBook.new(self, :opts=>LAYOUT_FILL_X|LAYOUT_FILL_Y)
    # Создаем первую вкладку
    tab1 = FXTabItem.new(tab_book, "Вкладка 1", nil)
    composite1 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)
    @first_tab = TabStudent.new(composite1)
    @first_tab.resize(1000,1000)

    # Создаем вторую вкладку
    tab2 = FXTabItem.new(tab_book, "Вкладка 2", nil)
    composite2 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)

  end

  private


end



