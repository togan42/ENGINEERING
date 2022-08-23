# SORU 1

import numpy as np
import matplotlib.pyplot as plt
import math
from scipy.fft import fft, fftfreq

# In[2]:


# gauss dağılımı pdfini hesaplayan fonksiyon
def gauss(x,ort,sigma):
    
   
    
    f = ( np.power(np.e, (-0.5 * (x-ort)**2 / sigma ) )  )/ (np.sqrt(2*np.pi*sigma) )
    
    return f


# In[3]:


# hesaplanmak üzere istenen aralıkta oluşturulan x değerleri:
x_ler = np.linspace(-5,10,100)


# In[10]:


# b şıkkı plotları
plt.title("0 ortalamalı X1 değişkeni gauss pdf'i")
plt.plot(x_ler, gauss(x_ler,0 ,1), label = "varyans = 1" )
plt.plot(x_ler, gauss(x_ler,0 ,5), label = "varyans = 5")
plt.xlabel("x")
plt.ylabel("fX1(x)")
plt.legend()
plt.show()


# In[12]:


# b şıkkı plotları
plt.title("3 ortalamalı X2 değişkeni gauss pdf'i")
plt.plot(x_ler, gauss(x_ler,3 ,1), label = "varyans = 1" )
plt.plot(x_ler, gauss(x_ler,3 ,5), label = "varyans = 5")
plt.xlabel("x")
plt.ylabel("fX2(x)")
plt.legend()
plt.show()


# In[13]:


# erf ile cdf hesaplayan fonksiyon
def cdf(x,ort,sigma):
    
    f = 0.5*(1 + math.erf((x-ort)/(np.sqrt(sigma*2))) )
    
    return f


# In[14]:


# fonksiyon sonuçlarının saklanacağı diziler
out_0_1 = np.zeros(100)
out_0_5 = np.zeros(100)
out_3_1 = np.zeros(100)
out_3_5 = np.zeros(100)

for i in range(100):
    out_0_1[i] = cdf(x_ler[i],0,1)
    out_0_5[i] = cdf(x_ler[i],0,5)
    out_3_1[i] = cdf(x_ler[i],3,1)
    out_3_5[i] = cdf(x_ler[i],3,5)
    


# In[17]:


# d şıkkı plotları
plt.title("0 ortalamalı X1 değişkeni gauss cdf'i")
plt.plot(x_ler, out_0_1, label = "varyans = 1" )
plt.plot(x_ler, out_0_5, label = "varyans = 5")
plt.xlabel("x")
plt.ylabel("FX1(x)")
plt.legend()
plt.show()


# In[18]:


# d şıkkı plotları
plt.title("3 ortalamalı X2 değişkeni gauss cdf'i")
plt.plot(x_ler, out_3_1, label = "varyans = 1" )
plt.plot(x_ler, out_3_5, label = "varyans = 5")
plt.xlabel("x")
plt.ylabel("FX2(x)")
plt.legend()
plt.show()


# In[19]:


# e şıkkı ihtimal hesapları :
prob = cdf(5,0,1) - cdf(1,0,1)
print("Varyans=1 için, Pr(5>X1>1) = " + str(prob))

prob = cdf(5,0,5) - cdf(1,0,5)
print("Varyans=5 için, Pr(5>X1>1) = " + str(prob))

prob = cdf(1,3,1) - cdf(0,3,1)
print("Varyans=1 için, Pr(1>X2>0) = " + str(prob))

prob = cdf(1,3,5) - cdf(0,3,5)
print("Varyans=5 için, Pr(1>X2>0) = " + str(prob))


# SORU 2

# sinyal üretildi
S_R = 1000

t = np.linspace(0, 1, S_R, endpoint=False)
x_t = np.cos((2 * np.pi) * t * 1)

# işaret plotu
plt.title("x(t) işareti")
plt.plot(t, x_t)
plt.xlabel("t[sn]")
plt.ylabel("x(t)")
plt.legend()
plt.show()



# darbe katarı üretildi
fs=10
ts= 1/fs
tao= 0.05

s_t = np.zeros(S_R)

for i in range(S_R):
    
    if(i == S_R):
        break
    
    if(i%100==0):

        for j in range(50):

            s_t[i+j] = 1

#darbe plotu
plt.title("s(t) darbe katarı")
plt.plot(t,s_t)
plt.xlabel("t[sn]")
plt.ylabel("s(t)")
plt.legend()
plt.show()

# xs(t) işaret plotu
xs_t = s_t*x_t
plt.title("x_s(t) işareti")
plt.plot(t,xs_t)
plt.xlabel("t[sn]")
plt.ylabel("x_s(t)")
plt.legend()
plt.show()



# fourier dönüşümü yapılıyor


N = S_R 

yf = fft(x_t) / S_R
xf = fftfreq(N, 1 / S_R)

plt.title("x(f) işareti genlik spektrumu")
plt.plot(xf, np.abs(yf))
plt.xlim([-50,50])
plt.xlabel("f[Hz]")
plt.ylabel("x(f)")
plt.legend()
plt.show()



yfs = fft(xs_t) / S_R
plt.title("x_s(f) işareti genlik spektrumu")
plt.plot(xf, np.abs(yfs))
plt.xlim([-50,50])
plt.xlabel("f[Hz]")
plt.ylabel("x_s(f)")
plt.legend()
plt.show()



# b şıkkı için a(t) üretildi
a_t = np.zeros(1000)

for i in range(1000):
    
    if(t[i%100] < 0.05):
        
        a_t[i] = 50*t[i%100] - 1.25
        
    else:
        
        a_t[i] = 3.75 - (50*t[i%100])

plt.title("a(t) işareti" )
plt.plot(t,a_t)
plt.xlabel("t[sn]")
plt.ylabel("a(t)")
plt.legend()
plt.show()



# pam işareti gerçekleniyor
x_pam = np.zeros(1000)

for i in range(1000):

    if(i%100==0):
        
        tut = x_t[i]

    x_pam[i] = tut

plt.title(" pam işareti x_pam(t)")
plt.plot(t,x_pam)
plt.xlabel("t[sn]")
plt.ylabel("x_pam(t)")
plt.legend()
plt.show()



f_t = x_pam + a_t
plt.title(" a(t) + x_pam(t) işareti toplamı")
plt.plot(t,f_t)
plt.xlabel("t[sn]")
plt.ylabel("x_pam(t)+a(t)")
plt.legend()
plt.show()



# pdm işareti hesaplanıyor
x_pdm = np.zeros(1000)

for i in range(1000):

    if(f_t[i]<0):

        x_pdm[i] = 0

    else:

        x_pdm[i] = 1

plt.title(" x_pdm(t) PDM işareti")
plt.plot(t,x_pdm)
plt.xlabel("t[sn]")
plt.ylabel("x_pdm(t)")
plt.legend()
plt.show()



yf_pdm = fft(x_pdm) / S_R
plt.title(" PDM işareti genlik spektrumu")
plt.plot(xf, np.abs(yf_pdm))
plt.xlim([-50,50])
plt.xlabel("f[Hz]")
plt.ylabel("x_pdm(f)")
plt.legend()
plt.show()

# PPM

# c şıkkı için PPM işareti oluşturuldu
x_ppm = np.zeros(1000)

for i in range(999):

    if(x_pdm[i]==1 and x_pdm[i+1]==0 ):

        # 3ms genlikte oluşturuldu:
        x_ppm[i]=1
        x_ppm[i+1]=1
        x_ppm[i+2]=1

plt.title("PPM işareti")
plt.plot(t,x_ppm)
plt.xlabel("t[sn]")
plt.ylabel("x_ppm(t)")
plt.legend()
plt.show()

yf_ppm = fft(x_ppm)/S_R
plt.title("PPM işareti genlik spektrumu")
plt.plot(xf, np.abs(yf_ppm))
plt.xlim([-50,50])
plt.xlabel("f[Hz]")
plt.ylabel("x_ppm(f)")
plt.legend()
plt.show()


x_ppm2 = np.zeros(1000)
say = 0
for i in range(900):
    
    if(x_pdm[i] == 1):
        say = say +1
    
    if( i % 100 == 0):
        kat = int(i/100)
        # 3ms lik tk darbesi
        x_ppm2[i+say+50] = 1
        x_ppm2[i+(say+1)+50] = 1
        x_ppm2[i+(say+2)+50] = 1
        say = 0



plt.title("PPM işareti")
plt.plot(t,x_ppm2)
plt.xlabel("t[sn]")
plt.ylabel("x_ppm(t)")
plt.legend()
plt.show()

yf_ppm = fft(x_ppm2)/S_R
plt.title("PPM işareti genlik spektrumu")
plt.plot(xf, np.abs(yf_ppm))
plt.xlim([-50,50])
plt.xlabel("f[Hz]")
plt.ylabel("x_ppm(f)")
plt.legend()
plt.show()



