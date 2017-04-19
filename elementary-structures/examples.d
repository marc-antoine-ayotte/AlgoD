import linkedlist;
import stacklist;
import std.stdio;

void main() {
    writeln("**********LinkedList**********");
    auto list = new LinkedList!int();
    for(int i = 0; i < 10; ++i) list.push(i);
    writeln(cast(string)list);
    writeln(list.size);
    list.clear();
    for(int i = 0; i < 10; ++i) list.append(i);
    writeln(cast(string)list);
    writeln(list[4]);
    list[4] = 100;
    writeln(cast(string)list);
    //writeln(list[11]);  would crash.

    writeln("\n**********Stack List**********");
    auto stack = new Stacklist!string();
    stack.push("place.");
    stack.push("right ");
    stack.push("its ");
    stack.push("in ");
    stack.push("Everything ");
    writeln(cast(string)stack);
    while(!stack.empty) {
        write(stack.pop());
    }
    
}