require './lib/module_errors.rb'

RSpec.describe Errors do
  include Errors
  let(:f_index){1}
  let(:correct_format_string){'  font-size: 14px;'}

  describe '#after_colon_space_error?' do
    context 'returns true with error message if there is no space after colon' do
      f_string = '  font-size:14px;'
      it { expect(after_colon_space_error?(f_string, f_index)).to eql(true)}
    end
    context 'returns no error message if there is a space after colon' do
      it { expect(after_colon_space_error?(correct_format_string, f_index)).not_to eql(true)}
    end
  end

  describe '#before_colon_space_error?' do
    context 'returns true with error message if there is a space before colon' do
      f_string = '  font-size :14px;'
      it { expect(before_colon_space_error?(f_string, f_index)).to eql(true)}
    end
    context 'returns no error message if there is a no space before colon' do
      it { expect(before_colon_space_error?(correct_format_string, f_index)).not_to eql(true)}
    end
  end

  describe '#white_trailing_space_error?' do
    context 'returns true with error message if there is a trailing white space' do
      f_string = 'font-size: 14px;'
      it { expect(white_trailing_space_error?(f_string, f_index)).to eql(true)}
    end
    context 'returns no error message if there is no trailing white space' do
      it { expect(white_trailing_space_error?(correct_format_string, f_index)).to eql(nil)}
    end
  end

end