#ifndef RC_FILTER_H
#define RC_FILTER_H

class RC_Filter {
  public:
    RC_Filter()=delete;
    explicit  RC_Filter(double _alpha=0.01): alpha(_alpha),pre_ut(0.0),pre_xt(0.0){};

    double low_pass(double xt)
    {
      double ut = (1-alpha)*pre_ut + alpha*xt;
        pre_ut=ut;
      return ut;
    };
    double high_pass(double xt)
    {
        double ut = alpha*(xt-pre_ut-pre_xt);
        pre_ut=ut;
      pre_xt=xt;
      return ut;
    };
private:
  double alpha;
  double pre_ut,pre_xt;
};





#endif