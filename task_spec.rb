-- LEVEL 3 --

3. describe Zombie do
  it { should_not be_genius }
  its(:iq) { should == 0 }

  context "with high iq" do
    subject { Zombie.new(iq: 3) }
    it { should be_genius }
    its(:brains_eaten_count) { should == 1 }
  end
end

4. describe Zombie do
  let(:zombie) { Zombie.new(tweets: [tweet]) }
  let(:tweet) { Tweet.new }

  subject { zombie }

  its(:tweets) { should include(tweet) }

  it "should have a latest tweet" do
    zombie.latest_tweet.should == tweet
  end
end


-- LEVEL 4 --

1. describe Zombie do
  let(:zombie) { Zombie.new }
  subject { zombie }
  before{zombie.eat_brains}
  it 'is not a dummy zombie' do
     zombie.should_not be_dummy
  end

  it 'is a genius zombie' do
    zombie.should be_genius
  end
end

2. describe Zombie do
  let(:zombie) { Zombie.new }
  before { zombie.iq = 0 }
  subject { zombie }

  it { should be_dummy }

  context 'with a smart zombie' do
    before { zombie.iq = 3 }
    it { should_not be_dummy }
  end
end

3. describe Zombie do
  let(:zombie) { Zombie.new }
  subject { zombie }

  context 'with a dummy zombie' do
    before { zombie.iq = 0 }
    it { should be_dummy }
  end

  context 'with a smart zombie' do
    before { zombie.iq = 3 }
    it { should_not be_dummy }
  end
end

4. shared_examples_for 'the brainless' do
  it { should be_dummy }
  it { should_not be_genius }
end

describe Zombie do
  let(:zombie) { Zombie.new }
  subject { zombie }
  it_behaves_like 'the brainless'
end

describe Plant do
  let(:plant) { Plant.new }
  subject { plant }
  it_behaves_like 'the brainless'
end

5. describe Zombie do
  let(:zombie) { Zombie.new }
  subject { zombie }

  context 'with a dummy zombie' do
    before { zombie.iq = 0 }
    it { should be_dummy }
  end

  context 'with a smart zombie' , focus: true do
    before { zombie.iq = 3 }
    it { should_not be_dummy }
  end
end


-- LEVEL 5 --

1. describe ZombieMailer do
  context '#tweet' do
    let(:zombie) { stub(email: 'anything@example.org') }
    let(:tweet) { stub(message: 'Arrrrgggghhhh') }

    subject { ZombieMailer.tweet(zombie, tweet) }
    its(:from) { should include('admin@codeschool.com') }
    its(:to) { should include(zombie.email) }
    its(:subject) { should == tweet.message }
  end
end

2. describe ZombieMailer do
  context '#tweet' do
    let(:zombie) { stub(:zombie, email: 'anything@example.org') }
    let(:tweet) { stub(:tweet, message: 'Arrrrgggghhhh') }

    subject { ZombieMailer.tweet(zombie, tweet) }
    its(:from) { should include('admin@codeschool.com') }
    its(:to) { should include(zombie.email) }
    its(:subject) { should == tweet.message }
  end
end

3. describe Tweet do
  context 'after create' do
    let(:zombie) { Zombie.create(email: 'anything@example.org') }
    let(:tweet) { zombie.tweets.new(message: 'Arrrrgggghhhh') }

    it 'calls "email_tweeter" on the tweet' do
      tweet.should_receive(:email_tweeter)
      tweet.save
    end
  end
end

4. describe Tweet do
  context 'after create' do
    let(:zombie) { Zombie.create(email: 'anything@example.org') }
    let(:tweet) { zombie.tweets.new(message: 'Arrrrgggghhhh') }
    let(:mail) { stub(deliver: true)}

    it 'calls "tweet" on the ZombieMailer' do
      ZombieMailer.should_receive(:tweet).and_return(mail)
      tweet.save
    end
  end
end

5. escribe Tweet do
  context 'after create' do
    let(:zombie) { Zombie.create(email: 'anything@example.org') }
    let(:tweet) { zombie.tweets.new(message: 'Arrrrgggghhhh') }
    let(:mail) { stub(:mail, deliver: true) }

    it 'calls "tweet" on the ZombieMailer' do
      ZombieMailer.should_receive(:tweet).with(zombie, tweet).and_return(mail)
      tweet.save
    end

    it 'calls "deliver" on the mail object' do
      pending
    end
  end
end

6. describe Tweet do
  context 'after create' do
    let(:zombie) { Zombie.create(email: 'anything@example.org') }
    let(:tweet) { zombie.tweets.new(message: 'Arrrrgggghhhh') }
    let(:mail) { stub(:mail, deliver: true) }

    it 'calls "tweet" on the ZombieMailer' do
      ZombieMailer.should_receive(:tweet).with(zombie, tweet).and_return(mail)
      tweet.save
    end

    it 'calls "deliver" on the mail object' do
      ZombieMailer.stub(tweet: mail)
      mail.should_receive(:deliver).and_return(true)
      tweet.save
    end
  end
end

7. describe Tweet do
  context 'after create' do
    let(:zombie) { Zombie.create(email: 'anything@example.org') }
    let(:tweet) { zombie.tweets.new(message: 'Arrrrgggghhhh') }
    let(:mail) { stub(:mail, deliver: true) }

    it 'calls "tweet" on the ZombieMailer as many times as there are zombies' do
      Zombie.stub(all: [stub, stub, stub])
      ZombieMailer.should_receive(:tweet).exactly(3).times.and_return(mail)
      tweet.save
    end
  end
end

-- LEVEL 6 --

1. module ValidateNumericalityOf
  class Matcher
    def initialize(attribute)
    end

    def matches?(model)
      false
    end

    def failure_message
      "Not implemented"
    end

    def negative_failure_message
      "Not implemented"
    end

    def description
      "Not implemented"
    end
  end

  def validate_numericality_of(attribute)
    pending
  end
end

RSpec.configure do |config|
  config.include ValidateNumericalityOf, type: :model
end

2. module ValidateNumericalityOf
  class Matcher
    def initialize(attribute)
      @attribute = attribute
    end

    def matches?(model)
      false
    end

    def failure_message
      "Not implemented"
    end

    def negative_failure_message
      "Not implemented"
    end

    def description
      "Not implemented"
    end
  end

  def validate_numericality_of(attribute)
    Matcher.new(attribute)
 end
end

RSpec.configure do |config|
  config.include ValidateNumericalityOf, type: :model
end

3. module ValidateNumericalityOf
  class Matcher
    def initialize(attribute)
      @attribute = attribute
    end

    def matches?(model)
      check_for_number model
    end

    def failure_message
      "Not implemented"
    end

    def negative_failure_message
      "Not implemented"
    end

    def description
      "validate numericality of #{@attribute}"
    end
    
    def check_for_number model
      model[@attribute] = "not a number"
      model.valid?
      model.errors[@attribute].include?("is not a number")
    end
  end

  def validate_numericality_of(attribute)
    Matcher.new(attribute)
  end
end

RSpec.configure do |config|
  config.include ValidateNumericalityOf, type: :model
end

4. module ValidateNumericalityOf
  class Matcher
    def initialize(attribute)
      @attribute = attribute
    end

    def matches?(model)
      @model = model
      check_for_number
    end

    def failure_message
      "#{@model.class} failed to validate: #{@attribute} numericality"
    end

    def negative_failure_message
      "#{@model.class} unexpected validation: #{@attribute} numericality"
    end

    def description
      "validate numericality of #{@attribute}"
    end
    
    def check_for_number
      @model[@attribute] = "not a number"
      @model.valid?
      @model.errors[@attribute].include?("is not a number")
    end
  end

  def validate_numericality_of(attribute)
    Matcher.new(attribute)
  end
end

RSpec.configure do |config|
  config.include ValidateNumericalityOf, type: :model
end

5. module ValidateNumericalityOf
  class Matcher
    def initialize(attribute)
      @attribute = attribute
      @options = {}
      @errors = []
    end

    def matches?(model)
      @model = model
      @model[@attribute] = "not a number"
      @model.valid?

      if !@model.errors[@attribute].include?("is not a number")
        @errors << "numericality" 
      end

      if @options[:only_integers]
        @model[@attribute] = 1.5
        @model.valid?
        if !@model.errors[@attribute].include?("must be an integer")
          @errors << "as an integer"
        end
      end

      @errors.empty?
    end

    def failure_message
      "#{@model.class} failed to validate: #{@attribute} #{@errors.join(', ')}"
    end

    def negative_failure_message
      "#{@model.class} unexpected validation: #{@attribute} #{@errors.join(', ')}"
    end

    def description
      "validate numericality of #{@attribute}"
    end

    def only_integers
      @options[:only_integers] = true
      self
    end
  end

  def validate_numericality_of(attribute)
    Matcher.new(attribute)
  end
end

RSpec.configure do |config|
  config.include ValidateNumericalityOf, type: :model
end

