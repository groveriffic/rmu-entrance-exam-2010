module TextEditor
  class Document
    def initialize
      @contents = ""
      @commands = []
      @reverted = []
    end

    def contents
      @contents = ""
      @commands.each { |command| command.apply! @contents }
      @contents
    end

    def add_text(text, position=-1)
      execute AddCommand.new(text, position)
    end

    def remove_text(first=0, last=contents.length)
      execute RemoveCommand.new(first,last)
    end

    def execute(cmd)
      @commands << cmd
      @reverted = []
    end

    def undo
      @reverted << @commands.pop unless @commands.empty?
    end

    def redo
      @commands << @reverted.pop unless @reverted.empty?
    end

    class AddCommand
      # Memory optimization #1
      # Encapsulating commands in classes rather than blocks
      # blocks are full fledged closures, so the will carry
      # all local scope with them.
      # See: http://olabini.com/blog/2007/12/ruby-closures-and-memory-usage/
      
      attr_accessor :text, :position

      def initialize(text, position)
        # Attempted Memory optimization #2
        # Convert text to symbol before saving it.
        # No effect on memory footprint
        @text = text
        @position = position
      end

      def apply!(contents)
        contents.insert(position, text)
      end

    end

    class RemoveCommand
      attr_accessor :first, :last
      
      def initialize(first, last)
        @first = first
        @last = last
      end

      def apply!(contents)
        contents.slice!(first...last)
      end
    end

  end
end
