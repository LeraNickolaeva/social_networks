# frozen_string_literal: true

class Fetcher
  URLS = {
    'twitter':   'https://takehome.io/twitter',
    'facebook':  'https://takehome.io/facebook',
    'instagram': 'https://takehome.io/instagram'
  }

  def self.run
    threads = []
    results = {}

    URLS.each do |name, url|
      threads << Thread.new do
        results[name] = Retrier.run(url)
      end
    end

    threads.each(&:join)

    results
  end
end
