require 'test_helper'

class QueryExecutorTest < ActiveSupport::TestCase
  def setup
    Mongoid.master.drop_collection('query_results')
  end
  
  def test_execute
    mf = File.read('test/fixtures/map_reduce/simple_map.js')
    rf = File.read('test/fixtures/map_reduce/simple_reduce.js')
    qe = QueryExecutor.new(mf, rf, 24601)
    qe.execute
    
    results = Mongoid.master['query_results'].find_one('_id' => 24601)
    assert_equal 231, results['M']
  end
  
end