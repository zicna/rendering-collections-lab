require "rails_helper"

RSpec.describe "classroom_show_view" do
  # let(:classroom) { Classroom.create(course_name: 'Math', semester: "Spring #{Time.now.year}") }

  before do
    products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]

    10.times do
      products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]
      Product.create(:name => products.sample, :price => Faker::Number.between(1,1500))
    end
    5.times do
      Customer.create(:name => Faker::Name.name)
    end

    5.times do
      Invoice.create
    end
    10.times do
      order = Order.create(:customer_id => Customer.all.collect(&:id).sample, :invoice_id => Invoice.all.collect(&:id).sample)
      order.products << Product.find(Product.all.collect(&:id).sample)
    end

  end

  it "renders classroom information on the show view" do
    # view.lookup_context.prefixes << "store_admin"
    # student = Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(25.years.ago, 18.years.ago))
    assign(:invoices, Invoice.all)
    render :template => "invoices/index.html.erb"
    expect(rendered).to render_template(:partial => "invoices/_invoice")
    # expect(rendered).to match /Math/
  end

  # it 'renders a partial that only contains classroom (not student) information' do
  #   view.lookup_context.prefixes = %w[students]
  #   assign(:classroom, classroom)
  #   render :partial => "classrooms/classroom.html.erb", locals: {classroom: classroom}
  #   expect(rendered).to match /Math/
  # end

  # it "renders a students/student partial" do
  #   view.lookup_context.prefixes = %w[students, classrooms]
  #   assign(:classroom, classroom)
  #   render :template => "classrooms/show.html.erb"
  #   expect(rendered).to render_template(:partial => "students/_student")
  # end

  # it "displays the student information from the partial" do
  #   view.lookup_context.prefixes = %w[students, classrooms]
  #   assign(:classroom, classroom)
  #   render :template => "classrooms/show.html.erb"
  #   expect(classroom.students.count).to eq 5
  #   classroom.students.each do |student|
  #     expect(rendered).to include(student.name)
  #   end
  # end
end