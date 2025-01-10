function dpdt = OdeFun(t, p)
    global R L C E;
    dpdt = zeros(2,1);
    dpdt(1) = p(2)/L;
    dpdt(2) = (E-5*R*p(1)-p(2))/(5*R*C);
end
