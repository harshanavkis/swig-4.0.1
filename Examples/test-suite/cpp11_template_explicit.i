/* This unit tests whether SWIG correctly parses the code and makes wrappers
   for the new C++11 extern templates (explicit template instantiation without
   using the translation unit).
*/
%module cpp11_template_explicit

#pragma SWIG nowarn=SWIGWARN_PARSE_EXPLICIT_TEMPLATE

%inline %{
#include <vector>

class A {
public:
  int member;
  int memberFunction() { return 100; }
};

template class std::vector<A>;
extern template class std::vector<A>;

template class std::vector<A*>;
extern template class std::vector<A*>;

template class std::vector<int>;
extern template class std::vector<int>;
%}

%template(VectorInt) std::vector<int>;
