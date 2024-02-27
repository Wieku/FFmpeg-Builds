FF_CONFIGURE="--enable-gpl --enable-version3 --disable-debug
--disable-autodetect

--disable-ffplay
--disable-postproc

--enable-nvenc
--enable-amf
--enable-mfx

--disable-decoders
--enable-decoder=h263,flv,h264,hevc,mjpeg,vp9,rawvideo,pcm_f32le,pcm_f32be,wrapped_avframe

--disable-devices
--enable-indev=lavfi

--disable-encoders
--enable-encoder=libx264,libx265,h264_nvenc,hevc_nvenc,av1_nvenc,h264_qsv,hevc_qsv,h264_amf,hevc_amf,aac,libmp3lame,libopus,flac,rawvideo

--disable-demuxers
--enable-demuxer=matroska,mov,avi,flv,rawvideo,wav,pcm_f32le,pcm_f32be,lavfi

--disable-muxers
--enable-muxer=mov,rawvideo,mp4,matroska,mp3,flac,ogg,null

--disable-protocols
--enable-protocol=file,pipe,fd"
FF_CFLAGS=""
FF_CXXFLAGS=""
FF_LDFLAGS=""
GIT_BRANCH="master"
LICENSE_FILE="COPYING.GPLv3"
