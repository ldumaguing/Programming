#include <iostream>

class A
{
    public: 
        A(int);
        
        void foo();
};

class B: public A
{
	public:
       B(int);
       B(int, int);

       void bar();
		int crap;
};

// *************************
A::A(int x) {
	int y = x;
};

void A::foo() {
	int y = 13;
}

// *************************
void B::bar() {
	int y = 1313;
}


B::B(int y, int x):A(x) {
	crap = x;
	std::cout << "..." << crap << "\n";
	std::cout << "..." << y << "\n";
}

int main(void)
{
    B *b = new B(5, 6);
    delete b;
}
