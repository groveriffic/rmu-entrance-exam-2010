module TextEditor
  class Document
    def initialize
      @contents = ""
    end

    def contents
    end

    def add_text(text, position=-1)
    end

    def remove_text(first=0, last=contents.length)
    end

    def execute(&block)
    end

    def undo
    end

    def redo
    end
  end
end
