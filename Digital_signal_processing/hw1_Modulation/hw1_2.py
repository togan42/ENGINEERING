# -*- coding: utf-8 -*-

import numpy as np
from matplotlib import pyplot as plt
from scipy.fft import fft, fftfreq

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

