require ::File.expand_path('../../spec_helper',  __FILE__)

describe Position do
	it { should validate_presence_of :latitude }
end