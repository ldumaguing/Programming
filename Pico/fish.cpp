class A
{
    public: 
        A(int x) {}
};

class B: public A
{
	public:
       B(int x):A(x){};
       B(int x, int y):A(x){};
};

int main(void)
{
    B *b = new B(5, 6);
    delete b;
}
