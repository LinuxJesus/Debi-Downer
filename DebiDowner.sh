echo "Run As Root Please"
echo "What package would you like?: "
read pkg

mkdir $pkg

cd $pkg

apt-get download $pkg && apt-cache depends -i $pkg | awk '/Depends:/ {print $2}' | xargs  apt-get download

echo "dpkg -i *.deb" >> install.sh
