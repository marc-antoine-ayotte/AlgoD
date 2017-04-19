import std.stdio;
import std.conv;




struct LinkedList(T) 
{
private:
    Node!T* _first;
    Node!T* _last;
    int _size;
    struct Node(T) {
        T _value;
        Node!T* _next;
    }
public:
    LinkedList!T  create() {
        return LinkedList!T(null,null,0);
    }

    void push( T element) {
        Node!T * node = new Node!T(element, null);
        if (_first == null) {
            _first = node;
            _last = _first;
        } else {
            node._next = this._first;
            this._first = node;
        }
        ++_size;
    }

    void append(T element) {
        Node!T * node = new Node!T(element, null);
        if (_last == null) {
            _first = node;
            _last = _first;
        } else {
            this._last._next = node;
            this._last = node;
        }
        ++_size;
    }

    void clear() {
        this._size = 0;
        this._first = null;
        this._last = null;
    }

    int size() const @property{
        return this._size;
    }

    string opCast() {
        string output = "List : [ " ;
        Node!T* current = this._first;
        for (int i = 0; i < _size; ++i) {
            output ~= text(current._value) ~ ", ";
            current = current._next;
        }
        return output[0 .. ($-2)] ~ " ]";
    }

    T opIndex(int index) {
        assert(index < size);
        Node!T * current =this._first;
        for(int i =0; i < index-1; ++i) current = current._next;
        return current._value; 
    }

    T opIndexAssign(T element, int index){
        assert(index < size);
        Node!T * current = this._first;
        for(int i =0; i < index-1; ++i) current = current._next;
        current._value = element;
        return element;
    }
    
}


void main() {
    auto list = LinkedList!int(null,null,0);
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
}