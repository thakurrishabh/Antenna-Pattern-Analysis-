function []=displaycustom(n,del,d,theta,phi,theta2dxy,theta2dyz,theta2dzx,thetauniv,n1,del1,d1,flag)
    while(1)
        psi=2*pi*d.*cos(theta)+del;
        psi2dxy=2*pi*d.*cos(theta2dxy)+del;
        psi2dyz=2*pi*d.*cos(theta2dyz)+del;
        psi2dzx=2*pi*d.*cos(theta2dzx)+del;
        psiuniv=thetauniv;
        psimax=2*pi*d+del;
        psimin=-2*pi*d+del;
        res=(1/n)*abs(sin((n*psi)/2)./sin(psi/2));
        res2dxy=(1/n)*(sin((n*psi2dxy)/2)./sin(psi2dxy/2));
        res2dyz=(1/n)*abs(sin((n*psi2dyz)/2)./sin(psi2dyz/2));
        res2dzx=(1/n)*abs(sin((n*psi2dzx)/2)./sin(psi2dzx/2));
        resuniv=(1/n)*abs(sin((n*psiuniv)/2)./sin(psiuniv/2));
        
        x=res.*sin(theta).*cos(phi);
        y=res.*sin(theta).*sin(phi);
        z=res.*cos(theta);
        
        subplot(6,8,[1,2,3,9,10,11,17,18,19]);
        [num2,den2]=rat(d);
        [num3,den3]=rat(del/pi);
        %plot3(-1:0.01:1,0,0,'.k');
        %text(1.75,-0.5,0,'theta = 0');
        surf(z,x,y);
        title(['N = ',num2str(n),' ,delta = ',sprintf('(%d/%d)',num3,den3),'\pi',' ,d = ',sprintf('(%d/%d)',num2,den2),'\lambda'],'fontsize',15);
        xlabel('z','fontsize',15);
        ylabel('x','fontsize',15);
        zlabel('y','fontsize',15);
        
        subplot(6,8,[5,6,7,8,13,14,15,16,21,22,23,24]);
        if(psimax~=0)
        [num,den]=rat(psimax/pi);
        else
            num=0;den=1;
        end
        if(psimin~=0)
        [num1,den1]=rat(psimin/pi);
        else
            num1=0;den1=1;
        end
        
        plot(thetauniv,20*log10(resuniv));
        
        if(psimax~=0)
        psimaxtemp=20*log10((1/n)*abs(sin((n*psimax)/2)./sin(psimax/2)));
        else
            psimaxtemp=0;
        end
        if(psimaxtemp<=-30)
            psimaxtemp=-30;
        end
        if(psimin~=0)
        psimintemp=20*log10((1/n)*abs(sin((n*psimin)/2)./sin(psimin/2)));
        else
            psimintemp=0;
        end
        if(psimintemp<=-30)
            psimintemp=-30;
        end
        text(psimax,psimaxtemp,['\leftarrow \psimax',sprintf(' = (%d/%d)',num,den),'\pi']);
        text(psimin,psimintemp,['\psimin',sprintf(' = (%d/%d)',num1,den1),'\pi \rightarrow'],'horizontalalignment','right');
        xlabel('\psi','fontsize',15);
        ylabel('power in dB','fontsize',15);
        title([' universal pattern \psi vs power in dB'],'fontsize',15);
        if(resuniv>-30)
            axis([-7*pi (7*pi) min(20*log10(resuniv))-1 max(20*log10(resuniv))+20]);
        else
            axis([-(7*pi) (7*pi) -35 max(20*log10(resuniv))+20]);
        end
        subplot(6,8,[33,34,41,42]);
        polarplot(0:pi/500:2*pi,res2dxy,'.r');
        title(['rad pattern xyplane'],'fontsize',15);
        subplot(6,8,[36,37,44,45]);
        polarplot(0:pi/500:2*pi,res2dyz,'.r');
        title(['rad pattern yzplane'],'fontsize',15);
        subplot(6,8,[39,40,47,48]);
        polarplot(0:pi/500:2*pi,res2dzx,'.r');
        title(['rad pattern zxplane'],'fontsize',15);
        if(flag==1)
            if(n<n1)
                n=n+1;
                fprintf('n = %d \n',n);
                fprintf('n1 = %d \n',n1);
            else
                break;
            end
        elseif(flag==2)
            if(d<d1)
                d=d+0.05;
                fprintf('d = %d \n',d);
                fprintf('d1 = %d \n',d1);
            else
                break;
            end
        elseif(flag==3)
            if(del<del1)
                 del=del+(0.1*(pi/4));
                 fprintf('del = %d \n',del);
                 fprintf('del1 = %d \n',del1);
            else
                break;
            end
            elseif(flag==4)
            if(n>n1)
                n=n-1;
                fprintf('-n = %d \n',n);
                fprintf('-n1 = %d \n',n);
            else
                break;
            end
            elseif(flag==5)
            if(d>d1)
                  d=d-0.05;
                  fprintf('-d = %d \n',d);
                  fprintf('-d1 = %d \n',d1);
            else
                break;
            end
            elseif(flag==6)
            if(del>del1)
                 del=del-(0.1*(pi/4));
                 fprintf('-del = %d \n',del);
                 fprintf('-del1 = %d \n',del1);
            else
                break;
            end
        end
        pause(0.0001);
    end