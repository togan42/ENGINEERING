% ALP TOGAN KÖMÜRLÜ 
clear all;
close all;

%% a şıkkı 

% üçgen işaret parametreleri
pd= makedist("Triangular",'a' ,-8,'b' ,0,'c',8) ;

N = 1000000;
% işaret oluşturuldu ve X'e atandı
Tria = random(pd, N,1);
X = Tria';

% histogram plotu
figure;
histogram(Tria, 'Normalization', 'pdf' );


hold on

%% pdf plotu (histogramla karşılaştırmak için)

x= -8:0.00001:8;

Pdf = pdf(pd, x);

plot(x,Pdf);
title("Histogram plotu") ;
legend('histogram', 'pdf' ); 
xlabel("X" );
ylabel("H(X)" );

%% b şıkkı 

% kuantalamanın gerçeklendiği döngü
for i = 1:length(Tria);
    
    if( Tria(i)<-6 )
        X_q1(i) = -7;
        
    end
    
    if( Tria(i)>-6 )
        X_q1(i) = -5;
        
    end
    
    if( Tria(i)>-4 )
        X_q1(i) = -3;
        
    end
    
    if( Tria(i)>-2 )
        X_q1(i) = -1;
        
    end
    
    if( Tria(i)>0 )
        X_q1(i) = 1;
        
    end
    
    if( Tria(i)>2 )
        X_q1(i) = 3;
        
    end
    
    if( Tria(i)>4)
        X_q1(i) = 5;
        
    end
    
    if( Tria(i)>6 )
        X_q1(i) = 7;
        
    end
        
end

% histogram plotu
figure;
histogram(X_q1, 'Normalization', 'pdf' );
title("Xq1 Histogram plotu") ;
legend('histogram', 'pdf' ); 
xlabel("Xq1" );
ylabel("H(Xq1)" );

%% c şıkkı 

% kuantalama gürültü hesabı
nq_1 = X - X_q1;
 
%kuantalama gürültü gücü
nq_1_guc = power(nq_1,2);

%işaret gücü
X_guc = power(X,2);

% SNR oranı
N_q1 = sum(X_guc)/sum(nq_1_guc);

fprintf(" Nq1 = SNR1 = %f", N_q1 )

%% d şıkkı

% A tipi sıkıştırma
A = 3;
X_normal = X/8;

for i = 1:length(X);
    
    if( abs(X_normal(i)) < 1/A );
        
        X_comp(i) = sign(X(i)) * (A * abs(X_normal(i))) / (1+log(A)) ;
    end
    
    if(  abs(X_normal(i)) >= 1/A );
        
        X_comp(i) = sign(X(i)) * (1+log( A* abs(X_normal(i)) )) /(1+log(A)) ;
    end
    
end

X_comp = 8 * X_comp;


% sıkıştırılmış işaretin kuantalamasının gerçeklendiği döngü
for i = 1:length(X_comp);
    
    if( X_comp(i)<-6 )
        X_comp_q(i) = -7;
        
    end
    
    if( X_comp(i)>-6 )
        X_comp_q(i) = -5;
        
    end
    
    if( X_comp(i)>-4 )
        X_comp_q(i) = -3;
        
    end
    
    if( X_comp(i)>-2 )
        X_comp_q(i) = -1;
        
    end
    
    if( X_comp(i)>0 )
        X_comp_q(i) = 1;
        
    end
    
    if( X_comp(i)>2 )
        X_comp_q(i) = 3;
        
    end
    
    if( X_comp(i)>4)
        X_comp_q(i) = 5;
        
    end
    
    if( X_comp(i)>6 )
        X_comp_q(i) = 7;
        
    end
        
end

figure;
histogram(X_comp_q, 'Normalization', 'pdf' );
title("Xcomp_q Histogram plotu") ;
legend('histogram', 'pdf' ); 
xlabel("Xcomp_q" );
ylabel("H(Xcomp_q)" );

%% e ve f şıkkı

% normalize ediliyor
X_comp_q  = X_comp_q /8;

% genişletme 
for i = 1:length(X_comp_q);
    
    if( abs(X_comp_q(i)) < 1/(1+log(A)) );
        
        X_q2(i) = sign(X_comp_q(i)) * abs(X_comp_q(i)) * (1+ log(A)) /A ;
    end
    
    if( abs(X_comp_q(i)) >= 1/(1+log(A)) );
        
        X_q2(i) = sign(X_comp_q(i)) * exp( ( ( (1+log(A)) * abs(X_comp_q(i)) ) -1 ) ) / A ;
    end
    
end

% normalize durumdan çıkarılıyor
X_q2 = X_q2 *8;

nq_2 = X - X_q2;

%kuantalama gürültü gücü
nq_2_guc = power(nq_2,2);

% SNR oranı
N_q2 = sum(X_guc)/sum(nq_2_guc);


figure;
histogram(nq_2, 'Normalization', 'pdf' );
title("n_q2 Histogram plotu") ;
legend('histogram', 'pdf' ); 
xlabel("n_q2" );
ylabel("H(n_q2)" );


fprintf(" Nq2 = SNR2 = %f", N_q2 );