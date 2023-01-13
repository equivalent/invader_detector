# InvaderDetector


[![Watch the video](https://user-images.githubusercontent.com/721990/212201748-8471504f-d1ff-4968-8bd0-158412444e5f.png)](https://www.youtube.com/watch?v=O4Jw-wbhU3g)


* How it works [Youtube video](https://youtu.be/O4Jw-wbhU3g)
* Demonstrating (strong) SOLID design principles is a priority not algorithm performance
* Screen Blinking is not a bug but a feature. There's a delay [implemented](https://github.com/equivalent/invader_detector/blob/master/lib/invader_detector/controller.rb#L27) = feels like a real radar this way
* Every Invader has multiple colors based on probability of a radar field. More info: [invaders.yml](https://github.com/equivalent/invader_detector/blob/master/data/invaders.yml) and [RadarFieldView#color](https://github.com/equivalent/invader_detector/blob/master/lib/invader_detector/views/radar_field_view.rb#L20)

#### Squid

medium probability = blue color | high probability = cyan color
<p align="left">
<img width="199" alt="squid_medium" src="https://user-images.githubusercontent.com/721990/212198981-33a4bab6-064c-459b-8805-24efc451189c.png">
<img width="168" alt="squid_high" src="https://user-images.githubusercontent.com/721990/212198987-ddcfc27d-9931-40e0-88d9-7360c3d60486.png">
</p>

#### Crab

medium probability = red color | high probability = magenta

<p align="left">
<img width="151" alt="crab_medium" src="https://user-images.githubusercontent.com/721990/212198997-4d6993ce-846b-465b-97dd-2a44529ebdcd.png">
<img width="172" alt="crab_high" src="https://user-images.githubusercontent.com/721990/212198999-c7b4a591-fea8-491d-844d-c4531b043a82.png">
</p>

#### Multiple

<img width="220" alt="squid_and_crab" src="https://user-images.githubusercontent.com/721990/212198990-00e71552-8517-4c67-9a34-daf7f6d46b51.png">


## Installation built gem from Github releases

```
wget https://github.com/equivalent/invader_detector/releases/download/0.0.2/invader_detector-0.0.2.gem
gem install invader_detector-0.0.2.gem
```

#### Usage

```
invader_detector                           # run with sample radar data
invader_detector /path/to/radar_data.txt
```

## Installation from source


```
git clone git@github.com:equivalent/invader_detector.git
cd invader_detector
bin/setup

bundle exec exe/run
```

to run tests

```
bundle exec rspec

# or
rake spec

# or to run tests with rubocop
rake
```

#### Usage

```
bundle exec exe/run                           # run with sample radar data
bundle exec exe/run /path/to/radar_data.txt
```
