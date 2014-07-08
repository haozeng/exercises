# Instruction to run test:
# rspec -fd email_predictor_spec.rb

require './email_predictor'

describe Pattern do
  let(:pattern) { Pattern.new }

  it 'should respond to first name' do
    expect(pattern).to respond_to(:first_name)
  end

  it 'should respond to last name' do
    expect(pattern).to respond_to(:last_name)
  end

  describe '#split' do
    it 'should split name into first_name and last_name if name is separted by white space' do
      pattern.split('John Ferguson')
      expect(pattern.first_name).to eql('John')
      expect(pattern.last_name).to eql('Ferguson')
    end

    it 'should split name into first_name and last_name if name is separted by .' do
      pattern.split('steve.jobs')
      expect(pattern.first_name).to eql('steve')
      expect(pattern.last_name).to eql('jobs')
    end
  end

  describe '#find' do
    it 'should generate pattern if first and last are full' do
      pattern.split('john.ferguson')
      expect(pattern.find).to eql(:first_name_dot_last_name)
    end

    it 'should generate pattern if first is initial and last is full' do
      pattern.split('j.ferguson')
      expect(pattern.find).to eql(:first_initial_dot_last_name)
    end

    it 'should generate pattern if first is full and last are initial' do
      pattern.split('john.f')
      expect(pattern.find).to eql(:first_name_dot_last_initial)
    end

    it 'should generate pattern if both are initial' do
      pattern.split('j.f')
      expect(pattern.find).to eql(:first_initial_dot_last_initial)
    end
  end

  describe '#predict' do
    it 'should be able to predict for first_name_dot_last_name' do
      pattern.split('john ferguson')
      expect(pattern.predict(:first_name_dot_last_name)).to eql('john.ferguson')
    end

    it 'should be able to predict for first_initial_dot_last_name' do
      pattern.split('john ferguson')
      expect(pattern.predict(:first_initial_dot_last_name)).to eql('j.ferguson')
    end

    it 'should be able to predict for first_name_dot_last_initial' do
      pattern.split('john ferguson')
      expect(pattern.predict(:first_name_dot_last_initial)).to eql('john.f')
    end

    it 'should be able to predict for first_initial_dot_last_initial' do
      pattern.split('john ferguson')
      expect(pattern.predict(:first_initial_dot_last_initial)).to eql('j.f')
    end
  end
end

describe Analyzer do

  let(:pattern) { Pattern.new }
  let(:analyzer) { Analyzer.new pattern: pattern }

  it 'should respond to dataset' do
    expect(analyzer).to respond_to(:dataset)
  end

  it 'should use hash as dataset' do
    expect(analyzer.dataset).to be_a(Hash)
  end

  it 'should respond to raw data' do
    expect(analyzer).to respond_to(:pattern)
  end

  describe '#process' do

    let(:raw) { { "John Ferguson" => "john.ferguson@alphasights.com" } }

    it 'should use pattern to split name and find pattern' do
      pattern.should_receive(:split)
      pattern.should_receive(:find).and_return(:first_name_dot_last_name)
      analyzer.process(raw)
    end

    it 'should be able to process data based on given rule' do
      analyzer.process(raw)
      expect(analyzer.dataset.size).to eql(1)
      expect(analyzer.dataset).to eql('alphasights.com' => [:first_name_dot_last_name])
    end

    let(:multiple) do
      {
        "John Ferguson" => "john.ferguson@alphasights.com",
        "Damon Aw" => "damon.aw@alphasights.com",
        "Linda Li" => "linda.li@alphasights.com",
        "Larry Page" => "larry.p@google.com"
      }
    end

    it 'should be albe to process data for multiple companies' do
      analyzer.process(multiple)
      expect(analyzer.dataset.size).to eql(2)
      expect(analyzer.dataset).to eql('alphasights.com' => [:first_name_dot_last_name],
                                      'google.com' => [:first_name_dot_last_initial])
    end
  end
end

describe Predictor do
  let(:pattern) { Pattern.new }
  let(:predictor) { Predictor.new pattern: pattern }

  it 'should respond to dataset' do
    expect(predictor).to respond_to(:dataset)
  end

  it 'should respond to pattern' do
    expect(predictor).to respond_to(:pattern)
  end

  describe '#formulate' do
    it 'should not formulate a email address if company is not given in the dataest' do
      predictor = Predictor.new pattern: pattern, dataset: {}
      attributes = { name: 'Barack Obama', email: 'whitehouse.gov'}
      response = predictor.formulate(attributes)
      expect(response).to eql("There is no matching in dataset for #{attributes[:name]} working for #{attributes[:email]}")
    end

    it 'should use pattern to split name and predict email' do
      predictor = Predictor.new pattern: pattern, dataset: { 'alphasights.com' => [:first_name_dot_last_name] }
      attributes = { name: 'Peter Wong', email: 'alphasights.com'}
      pattern.should_receive(:split).and_return(true)
      pattern.should_receive(:predict).and_return('peter.wong')
      predictor.formulate(attributes)
    end

    it 'should predict email address based if one pattern exist' do
      predictor = Predictor.new pattern: pattern, dataset: { 'alphasights.com' => [:first_name_dot_last_name] }
      attributes = { name: 'Peter Wong', email: 'alphasights.com'}
      response = predictor.formulate(attributes)
      expect(response).to eql(['peter.wong@alphasights.com'])
    end

    it 'should predict email address based if multiple patterns exist' do
      predictor = Predictor.new pattern: pattern, dataset: { 'google.com' => [:first_name_dot_last_initial, :first_initial_dot_last_name] }
      attributes = { name: 'Criag Silverstein', email: 'google.com' }
      response = predictor.formulate(attributes)
      expect(response).to match_array(['c.silverstein@google.com', 'criag.s@google.com'])
    end
  end
end
