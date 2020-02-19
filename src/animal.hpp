class Animal
{
public:
    Animal(int numLegs): numLegs(numLegs) {};

    int GetNumLegs();

private:
    const int numLegs;

};