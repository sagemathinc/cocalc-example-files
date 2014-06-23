︠0f861d4f-50be-4b0e-afa8-cbebafdb79c8︠
import wave

class SoundFile:
   def  __init__(self, signal,lab=''):
       self.file = wave.open('./test' + lab + '.wav', 'wb')
       self.signal = signal
       self.sr = 44100

   def write(self):
       self.file.setparams((1, 2, self.sr, 44100*4, 'NONE', 'noncompressed'))
       self.file.writeframes(self.signal)
       self.file.close()

mypi = float(pi)
from math import sin

@interact
def sinsound(freq_ratio =  slider(1/144,1,1/144,1/12)):
    hz1 = 440.0
    hz2 = float(440.0*2^freq_ratio)
    html('$\cos(\omega t) - \cos(\omega_0 t) = 2 \sin(\\frac{\omega + \omega_0}{2}t) \sin(\\frac{\omega - \omega_0}{2}t)$')
    s2 = [sin(hz1*x*mypi*2)+sin(hz2*x*mypi*2) for x in srange(0,4,1/44100.0)]
    s2m = max(s2)
    s2f = [16384*x/s2m for x in s2]
    s2str = ''.join(wave.struct.pack('h',x) for x in s2f)
    lab="%1.2f"%float(freq_ratio)
    f = SoundFile(s2str,lab=lab)
    f.write()
    pnum = 1500+int(500/freq_ratio)
    show(list_plot(s2[0:pnum],plotjoined=True))
    html('<embed src="cell://test'+ lab +'.wav" width="200" height="100"></embed>')
    html('Frequencies: '+ '$\omega_0 = ' + str(hz1) + ' $, $\omega = '+latex(hz2) + '$')
︡dede0cb1-960e-4f84-8e8c-b7a346bb1bbe︡{"interact":{"style":"None","flicker":false,"layout":[[["freq_ratio",12,null]],[["",12,null]]],"id":"24b2c063-b566-4cf6-a50a-d1aece4193c2","controls":[{"control_type":"slider","default":11,"var":"freq_ratio","width":null,"vals":["1/144","1/72","1/48","1/36","5/144","1/24","7/144","1/18","1/16","5/72","11/144","1/12","13/144","7/72","5/48","1/9","17/144","1/8","19/144","5/36","7/48","11/72","23/144","1/6","25/144","13/72","3/16","7/36","29/144","5/24","31/144","2/9","11/48","17/72","35/144","1/4","37/144","19/72","13/48","5/18","41/144","7/24","43/144","11/36","5/16","23/72","47/144","1/3","49/144","25/72","17/48","13/36","53/144","3/8","55/144","7/18","19/48","29/72","59/144","5/12","61/144","31/72","7/16","4/9","65/144","11/24","67/144","17/36","23/48","35/72","71/144","1/2","73/144","37/72","25/48","19/36","77/144","13/24","79/144","5/9","9/16","41/72","83/144","7/12","85/144","43/72","29/48","11/18","89/144","5/8","91/144","23/36","31/48","47/72","95/144","2/3","97/144","49/72","11/16","25/36","101/144","17/24","103/144","13/18","35/48","53/72","107/144","3/4","109/144","55/72","37/48","7/9","113/144","19/24","115/144","29/36","13/16","59/72","119/144","5/6","121/144","61/72","41/48","31/36","125/144","7/8","127/144","8/9","43/48","65/72","131/144","11/12","133/144","67/72","15/16","17/18","137/144","23/24","139/144","35/36","47/48","71/72","143/144","1"],"animate":true,"label":"freq_ratio","display_value":true}]}}︡
︠7228bbaf-adb8-436b-9e4f-f454f4c72498︠
    









