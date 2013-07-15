require 'helper'

describe Reclame::Reclamation do
  before do
    @slogan = Object.new
    @slogan.extend(Reclame::Reclamation)
    @proc = Proc.new{ @called = true}
  end

  describe 'when advertize a pattern' do
    before do
      @slogan.advertize('/post/:post_id') do
        @called = true
      end
    end

    it 'should return proc for matching request' do
      tmp_proc = @slogan.proc_for_request(rails_env('PATH_INFO' => '/post/1'))
      tmp_proc.call

      assert @called
    end
  end

  private
  RailsEnv = Struct.new(:env)

  def rails_env env
    RailsEnv.new rack_env env
  end

  def rack_env env
    {
      "rack.version"      => [1, 1],
      "rack.input"        => StringIO.new,
      "rack.errors"       => StringIO.new,
      "rack.multithread"  => true,
      "rack.multiprocess" => true,
      "rack.run_once"     => false,
      "REQUEST_METHOD"    => "GET",
      "SERVER_NAME"       => "example.org",
      "SERVER_PORT"       => "80",
      "QUERY_STRING"      => "",
      "PATH_INFO"         => "/content",
      "rack.url_scheme"   => "http",
      "HTTPS"             => "off",
      "SCRIPT_NAME"       => "",
      "CONTENT_LENGTH"    => "0"
    }.merge env
  end

end

