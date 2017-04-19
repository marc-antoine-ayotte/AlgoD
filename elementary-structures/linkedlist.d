import std.conv;


class LinkedList(T) {
private:
    Node!T* _first;
    Node!T* _last;
    int _size;
    struct Node(T) {
        T _value;
        Node!T* _next;
    }
public:
    this() {
        _first = null;
        _last = null;
        _size = size;
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

    T pop_front() 
    in {
        assert(!this.empty);
    }
    body {
        T element = this._first._value;
        if(this.size == 1) {
            this._first = null;
            this._last = null;
        } else {
            this._first = this._first._next;
        }
        --_size;
        return element;
    }

    void clear() {
        this._size = 0;
        this._first = null;
        this._last = null;
    }

    int size() const @property{
        return this._size;
    }

    bool empty() const @property{
        return this._size == 0;
    }

    string opCast() {
        string output = "List : { " ;
        Node!T* current = this._first;
        for (int i = 0; i < _size; ++i) {
            output ~= text(current._value) ~ "-> ";
            current = current._next;
        }
        return output[0 .. ($-3)] ~ " }";
    }

    T opIndex(int index) 
    in {
        assert(index < size);
    }
    body {
        Node!T*  current = this._first;
        for(int i =0; i < index-1; ++i) current = current._next;
        return current._value; 
    }

    T opIndexAssign(T element, int index)
    in {
        assert(index < size);
    }
    body {
        Node!T * current = this._first;
        for(int i =0; i < index-1; ++i) current = current._next;
        current._value = element;
        return element;
    }
    
}

