require_relative '../../lib/controllers/controller'
require 'spec_helper'

RSpec.describe Controller do
  let(:controller) { Controller.new }
    
  it 'should an instance of Controller' do
    expect(controller.class).to eq(Controller)
  end
end