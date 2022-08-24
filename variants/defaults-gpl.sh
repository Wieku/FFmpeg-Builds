FF_CONFIGURE="--enable-gpl --enable-version3 --disable-debug
--disable-autodetect

--disable-ffplay
--disable-avdevice
--disable-postproc

--enable-nvenc

--disable-decoders
--enable-decoder=h263,h264,hevc,mjpeg,vp9,rawvideo,pcm_f32le,pcm_f32be

--disable-encoders
--enable-encoder=libx264,libx265,h264_nvenc,hevc_nvenc,h264_qsv,hevc_qsv,aac,libmp3lame,libopus,flac,rawvideo

--disable-demuxers
--enable-demuxer=matroska,mov,avi,flv,rawvideo,wav,pcm_f32le,pcm_f32be

--disable-muxers
--enable-muxer=mov,rawvideo,mp4,matroska,mp3,flac,ogg

--disable-protocols
--enable-protocol=file,pipe"
FF_CFLAGS=""
FF_CXXFLAGS=""
FF_LDFLAGS=""
GIT_BRANCH="master"
LICENSE_FILE="COPYING.GPLv3"
