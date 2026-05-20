function [x_kp1,y_kp1] = iteration(x_k,y_k,Fx,Fy,gamma,A)

indice = sub2ind(size(Fx),round(y_k),round(x_k));
B_x = -gamma * Fx(indice);
B_y = -gamma * Fy(indice);

x_kp1 = A*x_k + B_x;
y_kp1 = A*y_k + B_y;

end