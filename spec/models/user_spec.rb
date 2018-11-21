describe User do

  before(:each) { @user = User.new(email: 'user@example.com',
                                   name: 'Example User',
                                   institucion: 'STPC') }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:name) }
  it { should respond_to(:institucion) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it "requires name" do
    @user.name = ""
    @user.valid?
    expect(@user.errors[:name].any?).to eq(true)
  end
  
  
  it "requires institucion" do
    @user.institucion = ""
    @user.valid?
    expect(@user.errors[:institucion].any?).to eq(true)
  end
end
