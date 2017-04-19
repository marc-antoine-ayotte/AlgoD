import linkedlist;
import std.conv;

class Stacklist(T){
private:
    LinkedList!T _list;
public:
    this() {
        _list = new LinkedList!T();
    }

    void push(T element) {
        this._list.push(element);
    }

    T peek() 
    in {
        assert(!this._list.empty);
    }
    body {
        return _list[0];
    }

    T pop() 
    in {
        assert(!this._list.empty);
    }
    body {
        return this._list.pop_front();
    }

    bool empty() const @property {
        return this._list.empty;
    }

    string opCast() {
        return "Stack" ~ cast(string)this._list;
    }
}

