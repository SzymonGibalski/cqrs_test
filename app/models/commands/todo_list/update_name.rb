# frozen_string_literal: true

module Commands
  class TodoList::UpdateName
    include Lib::Command

    attributes :todo_list, :name, :metadata

    private

    def build_event
      return nil if noop?

      Events::TodoList::NameUpdated.new(
          todo_list: todo_list,
          name: name,
          metadata: metadata
      )
    end

    def noop?
      name == todo_list.name
    end
  end
end
