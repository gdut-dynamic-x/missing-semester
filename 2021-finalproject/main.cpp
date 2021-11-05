#include <iostream>
#include <string>

class Lovers{
public:
    Lovers(std::string theName);
    void kiss(Lovers *lover);
    void ask(Lovers *lover, std::string something);//基类内部声明方法：kiss，ask

protected:
    std::string name; // 声明字符串变量：name，受protected保护，只有基类及其包括在内的子类可以调用

    friend class Others;//友元关系，使Others可以调用name的数据
};

class Boyfriend : public Lovers{
public:
    Boyfriend(std::string theName);
};
class Girlfriend : public Lovers{
public:
    Girlfriend(std::string theName);
};

//----------------在基类中声明两个子类，Boyfriend及Girlfriend

class Others{
public:
    Others(std::string theName);
    void kiss(Lovers *lover);
protected:
    std::string name;
};

Lovers::Lovers(std::string theName){
    name = theName;
}

void Lovers::kiss(Lovers *lover){
    std::cout << name << "kiss me dear" << lover->name << '\n';
}
void Lovers::ask(Lovers *lover, std::string something){
    std::cout << "sweat heart" << lover->name << "help me" << something << 'n';
}
//定义kiss及ask方法的内容

Boyfriend::Boyfriend(std::string theName) : Lovers(theName){
}
Girlfriend::Girlfriend(std::string theName) : Lovers(theName){
}


Others::Others(std::string theName){
    name = theName;
}

void Others::kiss(Lovers *lover){
    std::cout << name << " kiss !!!" << lover->name <<'\n';
}

int main()
{
    Boyfriend bf("A");
    Girlfriend gf("B");
    Others others("C");

    gf.kiss(&bf);
    gf.ask(&bf, "wash the clothes");
    //子类调用基类的方法

    std::cout << "here comes the C!\n";
    others.kiss(&gf);
    return 0;
}
