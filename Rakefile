task :default => 'test:mine'

namespace :test do 

  desc 'Unit and Memory test my code'
  task :mine => ['unit:mine', 'memory:mine']
  namespace :memory do 

    desc 'Memory Test my new TextEditor::Document'
    task :mine do
      # Memory tests require a clean ruby vm
      # chaining rake tasks would skew the results
      # backticks will put this in a different process
      puts `ruby -r lib/text_editor/document memory_test.rb`
    end

    desc 'Memory Test Original Fixed TextEditor::Document'
    task :ali_rizvi_fixed do
      puts `ruby -r lib/ali_rizvi_fixed memory_test.rb`
    end

    desc 'Memory Test Original TextEditor::Document'
    task :ali_rizvi do
      puts `ruby -r lib/ali_rizvi memory_test.rb`
    end

  end

  namespace :unit do
    desc 'Unit Test my new TextEditor::Document'
    task :mine do
      require 'lib/text_editor/document'
      require 'test/document_test'
    end

    desc 'Unit Test Original Fixed TextEditor::Document'
    task :ali_rizvi_fixed do
      require 'lib/ali_rizvi_fixed'
      require 'test/document_test'
    end

    desc 'Unit Test Original TextEditor::Document'
    task :ali_rizvi do
      require 'lib/ali_rizvi'
      require 'test/document_test'
    end

  end
end
