#!/bin/bash
# todo.sh - a simple todo list manager using wofi.

todo_file="$HOME/.to-dos"

# Check if the todo file exists, if not create it
if [ ! -f "$todo_file" ]; then
    touch "$todo_file"
fi

display_todos() {
    todos=$(cat "$todo_file" | wofi -d -p "Todo List" | awk '{$1=""; print $0}' | sed 's/^[ \t]*//')
    echo "$todos" > "$todo_file"
}

add_todo() {
    new_todo=$(echo "" | wofi -d -p "Add Todo" | awk '{$1=""; print $0}' | sed 's/^[ \t]*//')
    if [ -n "$new_todo" ]; then
        echo "- $new_todo" >> "$todo_file"
    fi
}

remove_todo() {
    todos=$(cat "$todo_file" | sed '/^$/d' | wofi -d -p "Remove Todo" | awk '{$1=""; print $0}' | sed 's/^[ \t]*//')
    if [ -n "$todos" ]; then
        sed -i "/$todos/d" "$todo_file"
    fi
}

while true; do
    display_todos

    # Get user input for action
    action=$(echo -e "a: Add Todo\nr: Remove Todo" | wofi -d -p "Select Action" | awk '{print $1}')

    case "$action" in
        a) add_todo ;;
        r) remove_todo ;;
        *) exit 0 ;;
    esac
done
