RSpec.shared_context "shared controller helpers" do |_parameter|
  let(:single_iteration_looper) { ->(&block) { block.call } }
end
