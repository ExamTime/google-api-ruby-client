# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module TestingV1
      
      # Identifies an account and how to log into it
      class Account
        include Google::Apis::Core::Hashable
      
        # Enables automatic Google account login.
        # If set, the service will automatically generate a Google test account and add
        # it to the device, before executing the test. Note that test accounts might be
        # reused.
        # Many applications show their full set of functionalities when an account is
        # present on the device. Logging into the device with these generated accounts
        # allows testing more functionalities.
        # Corresponds to the JSON property `googleAuto`
        # @return [Google::Apis::TestingV1::GoogleAuto]
        attr_accessor :google_auto
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @google_auto = args[:google_auto] if args.key?(:google_auto)
        end
      end
      
      # A single Android device.
      class AndroidDevice
        include Google::Apis::Core::Hashable
      
        # The id of the Android device to be used.
        # Use the EnvironmentDiscoveryService to get supported options.
        # Required
        # Corresponds to the JSON property `androidModelId`
        # @return [String]
        attr_accessor :android_model_id
      
        # The id of the Android OS version to be used.
        # Use the EnvironmentDiscoveryService to get supported options.
        # Required
        # Corresponds to the JSON property `androidVersionId`
        # @return [String]
        attr_accessor :android_version_id
      
        # The locale the test device used for testing.
        # Use the EnvironmentDiscoveryService to get supported options.
        # Required
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # How the device is oriented during the test.
        # Use the EnvironmentDiscoveryService to get supported options.
        # Required
        # Corresponds to the JSON property `orientation`
        # @return [String]
        attr_accessor :orientation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_model_id = args[:android_model_id] if args.key?(:android_model_id)
          @android_version_id = args[:android_version_id] if args.key?(:android_version_id)
          @locale = args[:locale] if args.key?(:locale)
          @orientation = args[:orientation] if args.key?(:orientation)
        end
      end
      
      # The currently supported Android devices.
      class AndroidDeviceCatalog
        include Google::Apis::Core::Hashable
      
        # The set of supported Android device models.
        # @OutputOnly
        # Corresponds to the JSON property `models`
        # @return [Array<Google::Apis::TestingV1::AndroidModel>]
        attr_accessor :models
      
        # Configuration that can be selected at the time a test is run.
        # Corresponds to the JSON property `runtimeConfiguration`
        # @return [Google::Apis::TestingV1::AndroidRuntimeConfiguration]
        attr_accessor :runtime_configuration
      
        # The set of supported Android OS versions.
        # @OutputOnly
        # Corresponds to the JSON property `versions`
        # @return [Array<Google::Apis::TestingV1::AndroidVersion>]
        attr_accessor :versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @models = args[:models] if args.key?(:models)
          @runtime_configuration = args[:runtime_configuration] if args.key?(:runtime_configuration)
          @versions = args[:versions] if args.key?(:versions)
        end
      end
      
      # A list of Android device configurations in which the test is to be executed.
      class AndroidDeviceList
        include Google::Apis::Core::Hashable
      
        # A list of Android devices
        # Required
        # Corresponds to the JSON property `androidDevices`
        # @return [Array<Google::Apis::TestingV1::AndroidDevice>]
        attr_accessor :android_devices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_devices = args[:android_devices] if args.key?(:android_devices)
        end
      end
      
      # A test of an Android application that can control an Android component
      # independently of its normal lifecycle.
      # Android instrumentation tests run an application APK and test APK inside the
      # same process on a virtual or physical AndroidDevice.  They also specify
      # a test runner class, such as com.google.GoogleTestRunner, which can vary
      # on the specific instrumentation framework chosen.
      # See <http://developer.android.com/tools/testing/testing_android.html> for
      # more information on types of Android tests.
      class AndroidInstrumentationTest
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `appApk`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :app_apk
      
        # The java package for the application under test.
        # Optional, default is determined by examining the application's manifest.
        # Corresponds to the JSON property `appPackageId`
        # @return [String]
        attr_accessor :app_package_id
      
        # The option of whether running each test within its own invocation of
        # instrumentation with Android Test Orchestrator or not.
        # ** Orchestrator is only compatible with AndroidJUnitRunner version 1.0 or
        # higher! **
        # Orchestrator offers the following benefits:
        # - No shared state
        # - Crashes are isolated
        # - Logs are scoped per test
        # See
        # <https://developer.android.com/training/testing/junit-runner.html#using-
        # android-test-orchestrator>
        # for more information about Android Test Orchestrator.
        # Optional, if empty, test will be run without orchestrator.
        # Corresponds to the JSON property `orchestratorOption`
        # @return [String]
        attr_accessor :orchestrator_option
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `testApk`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :test_apk
      
        # The java package for the test to be executed.
        # Optional, default is determined by examining the application's manifest.
        # Corresponds to the JSON property `testPackageId`
        # @return [String]
        attr_accessor :test_package_id
      
        # The InstrumentationTestRunner class.
        # Optional, default is determined by examining the application's manifest.
        # Corresponds to the JSON property `testRunnerClass`
        # @return [String]
        attr_accessor :test_runner_class
      
        # Each target must be fully qualified with the package name or class name,
        # in one of these formats:
        # - "package package_name"
        # - "class package_name.class_name"
        # - "class package_name.class_name#method_name"
        # Optional, if empty, all targets in the module will be run.
        # Corresponds to the JSON property `testTargets`
        # @return [Array<String>]
        attr_accessor :test_targets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_apk = args[:app_apk] if args.key?(:app_apk)
          @app_package_id = args[:app_package_id] if args.key?(:app_package_id)
          @orchestrator_option = args[:orchestrator_option] if args.key?(:orchestrator_option)
          @test_apk = args[:test_apk] if args.key?(:test_apk)
          @test_package_id = args[:test_package_id] if args.key?(:test_package_id)
          @test_runner_class = args[:test_runner_class] if args.key?(:test_runner_class)
          @test_targets = args[:test_targets] if args.key?(:test_targets)
        end
      end
      
      # A set of Android device configuration permutations is defined by the
      # the cross-product of the given axes.  Internally, the given AndroidMatrix
      # will be expanded into a set of AndroidDevices.
      # Only supported permutations will be instantiated.  Invalid permutations
      # (e.g., incompatible models/versions) are ignored.
      class AndroidMatrix
        include Google::Apis::Core::Hashable
      
        # The ids of the set of Android device to be used.
        # Use the EnvironmentDiscoveryService to get supported options.
        # Required
        # Corresponds to the JSON property `androidModelIds`
        # @return [Array<String>]
        attr_accessor :android_model_ids
      
        # The ids of the set of Android OS version to be used.
        # Use the EnvironmentDiscoveryService to get supported options.
        # Required
        # Corresponds to the JSON property `androidVersionIds`
        # @return [Array<String>]
        attr_accessor :android_version_ids
      
        # The set of locales the test device will enable for testing.
        # Use the EnvironmentDiscoveryService to get supported options.
        # Required
        # Corresponds to the JSON property `locales`
        # @return [Array<String>]
        attr_accessor :locales
      
        # The set of orientations to test with.
        # Use the EnvironmentDiscoveryService to get supported options.
        # Required
        # Corresponds to the JSON property `orientations`
        # @return [Array<String>]
        attr_accessor :orientations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_model_ids = args[:android_model_ids] if args.key?(:android_model_ids)
          @android_version_ids = args[:android_version_ids] if args.key?(:android_version_ids)
          @locales = args[:locales] if args.key?(:locales)
          @orientations = args[:orientations] if args.key?(:orientations)
        end
      end
      
      # A description of an Android device tests may be run on.
      class AndroidModel
        include Google::Apis::Core::Hashable
      
        # The company that this device is branded with.
        # Example: "Google", "Samsung"
        # @OutputOnly
        # Corresponds to the JSON property `brand`
        # @return [String]
        attr_accessor :brand
      
        # The name of the industrial design.
        # This corresponds to android.os.Build.DEVICE
        # @OutputOnly
        # Corresponds to the JSON property `codename`
        # @return [String]
        attr_accessor :codename
      
        # Whether this device is virtual or physical.
        # @OutputOnly
        # Corresponds to the JSON property `form`
        # @return [String]
        attr_accessor :form
      
        # The unique opaque id for this model.
        # Use this for invoking the TestExecutionService.
        # @OutputOnly
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The manufacturer of this device.
        # @OutputOnly
        # Corresponds to the JSON property `manufacturer`
        # @return [String]
        attr_accessor :manufacturer
      
        # The human-readable marketing name for this device model.
        # Examples: "Nexus 5", "Galaxy S5"
        # @OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Screen density in DPI.
        # This corresponds to ro.sf.lcd_density
        # @OutputOnly
        # Corresponds to the JSON property `screenDensity`
        # @return [Fixnum]
        attr_accessor :screen_density
      
        # Screen size in the horizontal (X) dimension measured in pixels.
        # @OutputOnly
        # Corresponds to the JSON property `screenX`
        # @return [Fixnum]
        attr_accessor :screen_x
      
        # Screen size in the vertical (Y) dimension measured in pixels.
        # @OutputOnly
        # Corresponds to the JSON property `screenY`
        # @return [Fixnum]
        attr_accessor :screen_y
      
        # The list of supported ABIs for this device.
        # This corresponds to either android.os.Build.SUPPORTED_ABIS (for API level
        # 21 and above) or android.os.Build.CPU_ABI/CPU_ABI2.
        # The most preferred ABI is the first element in the list.
        # Elements are optionally prefixed by "version_id:" (where version_id is
        # the id of an AndroidVersion), denoting an ABI that is supported only on
        # a particular version.
        # @OutputOnly
        # Corresponds to the JSON property `supportedAbis`
        # @return [Array<String>]
        attr_accessor :supported_abis
      
        # The set of Android versions this device supports.
        # @OutputOnly
        # Corresponds to the JSON property `supportedVersionIds`
        # @return [Array<String>]
        attr_accessor :supported_version_ids
      
        # Tags for this dimension.
        # Examples: "default", "preview", "deprecated"
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @brand = args[:brand] if args.key?(:brand)
          @codename = args[:codename] if args.key?(:codename)
          @form = args[:form] if args.key?(:form)
          @id = args[:id] if args.key?(:id)
          @manufacturer = args[:manufacturer] if args.key?(:manufacturer)
          @name = args[:name] if args.key?(:name)
          @screen_density = args[:screen_density] if args.key?(:screen_density)
          @screen_x = args[:screen_x] if args.key?(:screen_x)
          @screen_y = args[:screen_y] if args.key?(:screen_y)
          @supported_abis = args[:supported_abis] if args.key?(:supported_abis)
          @supported_version_ids = args[:supported_version_ids] if args.key?(:supported_version_ids)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # A test of an android application that explores the application on a virtual
      # or physical Android Device, finding culprits and crashes as it goes.
      class AndroidRoboTest
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `appApk`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :app_apk
      
        # The initial activity that should be used to start the app.
        # Optional
        # Corresponds to the JSON property `appInitialActivity`
        # @return [String]
        attr_accessor :app_initial_activity
      
        # The java package for the application under test.
        # Optional, default is determined by examining the application's manifest.
        # Corresponds to the JSON property `appPackageId`
        # @return [String]
        attr_accessor :app_package_id
      
        # The max depth of the traversal stack Robo can explore. Needs to be at least
        # 2 to make Robo explore the app beyond the first activity.
        # Default is 50.
        # Optional
        # Corresponds to the JSON property `maxDepth`
        # @return [Fixnum]
        attr_accessor :max_depth
      
        # The max number of steps Robo can execute.
        # Default is no limit.
        # Optional
        # Corresponds to the JSON property `maxSteps`
        # @return [Fixnum]
        attr_accessor :max_steps
      
        # A set of directives Robo should apply during the crawl.
        # This allows users to customize the crawl. For example, the username and
        # password for a test account can be provided.
        # Optional
        # Corresponds to the JSON property `roboDirectives`
        # @return [Array<Google::Apis::TestingV1::RoboDirective>]
        attr_accessor :robo_directives
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_apk = args[:app_apk] if args.key?(:app_apk)
          @app_initial_activity = args[:app_initial_activity] if args.key?(:app_initial_activity)
          @app_package_id = args[:app_package_id] if args.key?(:app_package_id)
          @max_depth = args[:max_depth] if args.key?(:max_depth)
          @max_steps = args[:max_steps] if args.key?(:max_steps)
          @robo_directives = args[:robo_directives] if args.key?(:robo_directives)
        end
      end
      
      # Configuration that can be selected at the time a test is run.
      class AndroidRuntimeConfiguration
        include Google::Apis::Core::Hashable
      
        # The set of available locales.
        # @OutputOnly
        # Corresponds to the JSON property `locales`
        # @return [Array<Google::Apis::TestingV1::Locale>]
        attr_accessor :locales
      
        # The set of available orientations.
        # @OutputOnly
        # Corresponds to the JSON property `orientations`
        # @return [Array<Google::Apis::TestingV1::Orientation>]
        attr_accessor :orientations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @locales = args[:locales] if args.key?(:locales)
          @orientations = args[:orientations] if args.key?(:orientations)
        end
      end
      
      # A test of an Android Application with a Test Loop.
      # The intent <intent-name> will be implicitly added, since Games is the only
      # user of this api, for the time being.
      class AndroidTestLoop
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `appApk`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :app_apk
      
        # The java package for the application under test.
        # Optional, default is determined by examining the application's manifest.
        # Corresponds to the JSON property `appPackageId`
        # @return [String]
        attr_accessor :app_package_id
      
        # The list of scenario labels that should be run during the test.
        # The scenario labels should map to labels defined in the application's
        # manifest. For example, player_experience and
        # com.google.test.loops.player_experience add all of the loops labeled in the
        # manifest with the com.google.test.loops.player_experience name to the
        # execution.
        # Optional. Scenarios can also be specified in the scenarios field.
        # Corresponds to the JSON property `scenarioLabels`
        # @return [Array<String>]
        attr_accessor :scenario_labels
      
        # The list of scenarios that should be run during the test.
        # Optional, default is all test loops, derived from the application's
        # manifest.
        # Corresponds to the JSON property `scenarios`
        # @return [Array<Fixnum>]
        attr_accessor :scenarios
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_apk = args[:app_apk] if args.key?(:app_apk)
          @app_package_id = args[:app_package_id] if args.key?(:app_package_id)
          @scenario_labels = args[:scenario_labels] if args.key?(:scenario_labels)
          @scenarios = args[:scenarios] if args.key?(:scenarios)
        end
      end
      
      # A version of the Android OS
      class AndroidVersion
        include Google::Apis::Core::Hashable
      
        # The API level for this Android version.
        # Examples: 18, 19
        # @OutputOnly
        # Corresponds to the JSON property `apiLevel`
        # @return [Fixnum]
        attr_accessor :api_level
      
        # The code name for this Android version.
        # Examples: "JellyBean", "KitKat"
        # @OutputOnly
        # Corresponds to the JSON property `codeName`
        # @return [String]
        attr_accessor :code_name
      
        # Data about the relative number of devices running a
        # given configuration of the Android platform.
        # Corresponds to the JSON property `distribution`
        # @return [Google::Apis::TestingV1::Distribution]
        attr_accessor :distribution
      
        # An opaque id for this Android version.
        # Use this id to invoke the TestExecutionService.
        # @OutputOnly
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Represents a whole calendar date, e.g. date of birth. The time of day and
        # time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. The day may be 0 to
        # represent a year and month where the day is not significant, e.g. credit card
        # expiration date. The year may be 0 to represent a month and day independent
        # of year, e.g. anniversary date. Related types are google.type.TimeOfDay
        # and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `releaseDate`
        # @return [Google::Apis::TestingV1::Date]
        attr_accessor :release_date
      
        # Tags for this dimension.
        # Examples: "default", "preview", "deprecated"
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        # A string representing this version of the Android OS.
        # Examples: "4.3", "4.4"
        # @OutputOnly
        # Corresponds to the JSON property `versionString`
        # @return [String]
        attr_accessor :version_string
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_level = args[:api_level] if args.key?(:api_level)
          @code_name = args[:code_name] if args.key?(:code_name)
          @distribution = args[:distribution] if args.key?(:distribution)
          @id = args[:id] if args.key?(:id)
          @release_date = args[:release_date] if args.key?(:release_date)
          @tags = args[:tags] if args.key?(:tags)
          @version_string = args[:version_string] if args.key?(:version_string)
        end
      end
      
      # Response containing the current state of the specified test matrix.
      class CancelTestMatrixResponse
        include Google::Apis::Core::Hashable
      
        # The current rolled-up state of the test matrix.
        # If this state is already final, then the cancelation request will
        # have no effect.
        # Corresponds to the JSON property `testState`
        # @return [String]
        attr_accessor :test_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @test_state = args[:test_state] if args.key?(:test_state)
        end
      end
      
      # Information about the client which invoked the test.
      class ClientInfo
        include Google::Apis::Core::Hashable
      
        # The list of detailed information about client.
        # Corresponds to the JSON property `clientInfoDetails`
        # @return [Array<Google::Apis::TestingV1::ClientInfoDetail>]
        attr_accessor :client_info_details
      
        # Client name, such as gcloud.
        # Required
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_info_details = args[:client_info_details] if args.key?(:client_info_details)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Key-value pair of detailed information about the client which invoked the
      # test. For example `'Version', '1.0'`, `'Release Track', 'BETA'`
      class ClientInfoDetail
        include Google::Apis::Core::Hashable
      
        # The key of detailed client information.
        # Required
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The value of detailed client information.
        # Required
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Represents a whole calendar date, e.g. date of birth. The time of day and
      # time zone are either specified elsewhere or are not significant. The date
      # is relative to the Proleptic Gregorian Calendar. The day may be 0 to
      # represent a year and month where the day is not significant, e.g. credit card
      # expiration date. The year may be 0 to represent a month and day independent
      # of year, e.g. anniversary date. Related types are google.type.TimeOfDay
      # and `google.protobuf.Timestamp`.
      class Date
        include Google::Apis::Core::Hashable
      
        # Day of month. Must be from 1 to 31 and valid for the year and month, or 0
        # if specifying a year/month where the day is not significant.
        # Corresponds to the JSON property `day`
        # @return [Fixnum]
        attr_accessor :day
      
        # Month of year. Must be from 1 to 12.
        # Corresponds to the JSON property `month`
        # @return [Fixnum]
        attr_accessor :month
      
        # Year of date. Must be from 1 to 9999, or 0 if specifying a date without
        # a year.
        # Corresponds to the JSON property `year`
        # @return [Fixnum]
        attr_accessor :year
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @month = args[:month] if args.key?(:month)
          @year = args[:year] if args.key?(:year)
        end
      end
      
      # A single device file description.
      class DeviceFile
        include Google::Apis::Core::Hashable
      
        # An opaque binary blob file to install on the device before the test starts
        # Corresponds to the JSON property `obbFile`
        # @return [Google::Apis::TestingV1::ObbFile]
        attr_accessor :obb_file
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @obb_file = args[:obb_file] if args.key?(:obb_file)
        end
      end
      
      # Data about the relative number of devices running a
      # given configuration of the Android platform.
      class Distribution
        include Google::Apis::Core::Hashable
      
        # The estimated fraction (0-1) of the total market with this configuration.
        # @OutputOnly
        # Corresponds to the JSON property `marketShare`
        # @return [Float]
        attr_accessor :market_share
      
        # The time this distribution was measured.
        # @OutputOnly
        # Corresponds to the JSON property `measurementTime`
        # @return [String]
        attr_accessor :measurement_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @market_share = args[:market_share] if args.key?(:market_share)
          @measurement_time = args[:measurement_time] if args.key?(:measurement_time)
        end
      end
      
      # The environment in which the test is run.
      class Environment
        include Google::Apis::Core::Hashable
      
        # A single Android device.
        # Corresponds to the JSON property `androidDevice`
        # @return [Google::Apis::TestingV1::AndroidDevice]
        attr_accessor :android_device
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_device = args[:android_device] if args.key?(:android_device)
        end
      end
      
      # The matrix of environments in which the test is to be executed.
      class EnvironmentMatrix
        include Google::Apis::Core::Hashable
      
        # A list of Android device configurations in which the test is to be executed.
        # Corresponds to the JSON property `androidDeviceList`
        # @return [Google::Apis::TestingV1::AndroidDeviceList]
        attr_accessor :android_device_list
      
        # A set of Android device configuration permutations is defined by the
        # the cross-product of the given axes.  Internally, the given AndroidMatrix
        # will be expanded into a set of AndroidDevices.
        # Only supported permutations will be instantiated.  Invalid permutations
        # (e.g., incompatible models/versions) are ignored.
        # Corresponds to the JSON property `androidMatrix`
        # @return [Google::Apis::TestingV1::AndroidMatrix]
        attr_accessor :android_matrix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_device_list = args[:android_device_list] if args.key?(:android_device_list)
          @android_matrix = args[:android_matrix] if args.key?(:android_matrix)
        end
      end
      
      # A key-value pair passed as an environment variable to the test
      class EnvironmentVariable
        include Google::Apis::Core::Hashable
      
        # Key for the environment variable
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Value for the environment variable
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A reference to a file, used for user inputs.
      class FileReference
        include Google::Apis::Core::Hashable
      
        # A path to a file in Google Cloud Storage.
        # Example: gs://build-app-1414623860166/app-debug-unaligned.apk
        # Corresponds to the JSON property `gcsPath`
        # @return [String]
        attr_accessor :gcs_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_path = args[:gcs_path] if args.key?(:gcs_path)
        end
      end
      
      # Enables automatic Google account login.
      # If set, the service will automatically generate a Google test account and add
      # it to the device, before executing the test. Note that test accounts might be
      # reused.
      # Many applications show their full set of functionalities when an account is
      # present on the device. Logging into the device with these generated accounts
      # allows testing more functionalities.
      class GoogleAuto
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A storage location within Google cloud storage (GCS).
      class GoogleCloudStorage
        include Google::Apis::Core::Hashable
      
        # The path to a directory in GCS that will
        # eventually contain the results for this test.
        # The requesting user must have write access on the bucket in the supplied
        # path.
        # Required
        # Corresponds to the JSON property `gcsPath`
        # @return [String]
        attr_accessor :gcs_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_path = args[:gcs_path] if args.key?(:gcs_path)
        end
      end
      
      # A location/region designation for language.
      class Locale
        include Google::Apis::Core::Hashable
      
        # The id for this locale.
        # Example: "en_US"
        # @OutputOnly
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # A human-friendly name for this language/locale.
        # Example: "English"
        # @OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A human-friendly string representing the region for this locale.
        # Example: "United States"
        # Not present for every locale.
        # @OutputOnly
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        # Tags for this dimension.
        # Examples: "default"
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @region = args[:region] if args.key?(:region)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # 
      class NetworkConfiguration
        include Google::Apis::Core::Hashable
      
        # Network emulation parameters
        # Corresponds to the JSON property `downRule`
        # @return [Google::Apis::TestingV1::TrafficRule]
        attr_accessor :down_rule
      
        # The unique opaque id for this network traffic configuration
        # @OutputOnly
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Network emulation parameters
        # Corresponds to the JSON property `upRule`
        # @return [Google::Apis::TestingV1::TrafficRule]
        attr_accessor :up_rule
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @down_rule = args[:down_rule] if args.key?(:down_rule)
          @id = args[:id] if args.key?(:id)
          @up_rule = args[:up_rule] if args.key?(:up_rule)
        end
      end
      
      # 
      class NetworkConfigurationCatalog
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `configurations`
        # @return [Array<Google::Apis::TestingV1::NetworkConfiguration>]
        attr_accessor :configurations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configurations = args[:configurations] if args.key?(:configurations)
        end
      end
      
      # An opaque binary blob file to install on the device before the test starts
      class ObbFile
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `obb`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :obb
      
        # OBB file name which must conform to the format as specified by
        # Android
        # e.g. [main|patch].0300110.com.example.android.obb
        # which will be installed into
        # <shared-storage>/Android/obb/<package-name>/
        # on the device
        # Required
        # Corresponds to the JSON property `obbFileName`
        # @return [String]
        attr_accessor :obb_file_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @obb = args[:obb] if args.key?(:obb)
          @obb_file_name = args[:obb_file_name] if args.key?(:obb_file_name)
        end
      end
      
      # Screen orientation of the device.
      class Orientation
        include Google::Apis::Core::Hashable
      
        # The id for this orientation.
        # Example: "portrait"
        # @OutputOnly
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # A human-friendly name for this orientation.
        # Example: "portrait"
        # @OutputOnly
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Tags for this dimension.
        # Examples: "default"
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # Locations where the results of running the test are stored.
      class ResultStorage
        include Google::Apis::Core::Hashable
      
        # A storage location within Google cloud storage (GCS).
        # Corresponds to the JSON property `googleCloudStorage`
        # @return [Google::Apis::TestingV1::GoogleCloudStorage]
        attr_accessor :google_cloud_storage
      
        # Represents a tool results execution resource.
        # This has the results of a TestMatrix.
        # Corresponds to the JSON property `toolResultsExecution`
        # @return [Google::Apis::TestingV1::ToolResultsExecution]
        attr_accessor :tool_results_execution
      
        # Represents a tool results history resource.
        # Corresponds to the JSON property `toolResultsHistory`
        # @return [Google::Apis::TestingV1::ToolResultsHistory]
        attr_accessor :tool_results_history
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @google_cloud_storage = args[:google_cloud_storage] if args.key?(:google_cloud_storage)
          @tool_results_execution = args[:tool_results_execution] if args.key?(:tool_results_execution)
          @tool_results_history = args[:tool_results_history] if args.key?(:tool_results_history)
        end
      end
      
      # Directs Robo to interact with a specific UI element if it is encountered
      # during the crawl. Currently, Robo can perform text entry or element click.
      class RoboDirective
        include Google::Apis::Core::Hashable
      
        # The type of action that Robo should perform on the specified element.
        # Required.
        # Corresponds to the JSON property `actionType`
        # @return [String]
        attr_accessor :action_type
      
        # The text that Robo is directed to set. If left empty, the directive will be
        # treated as a CLICK on the element matching the resource_name.
        # Optional
        # Corresponds to the JSON property `inputText`
        # @return [String]
        attr_accessor :input_text
      
        # The android resource name of the target UI element
        # For example,
        # in Java: R.string.foo
        # in xml: @string/foo
        # Only the “foo” part is needed.
        # Reference doc:
        # https://developer.android.com/guide/topics/resources/accessing-resources.html
        # Required
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_type = args[:action_type] if args.key?(:action_type)
          @input_text = args[:input_text] if args.key?(:input_text)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
        end
      end
      
      # Additional details about the progress of the running test.
      class TestDetails
        include Google::Apis::Core::Hashable
      
        # If the TestState is ERROR, then this string will contain human-readable
        # details about the error.
        # @OutputOnly
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # Human-readable, detailed descriptions of the test's progress.
        # For example: "Provisioning a device", "Starting Test".
        # During the course of execution new data may be appended
        # to the end of progress_messages.
        # @OutputOnly
        # Corresponds to the JSON property `progressMessages`
        # @return [Array<String>]
        attr_accessor :progress_messages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_message = args[:error_message] if args.key?(:error_message)
          @progress_messages = args[:progress_messages] if args.key?(:progress_messages)
        end
      end
      
      # A description of a test environment.
      class TestEnvironmentCatalog
        include Google::Apis::Core::Hashable
      
        # The currently supported Android devices.
        # Corresponds to the JSON property `androidDeviceCatalog`
        # @return [Google::Apis::TestingV1::AndroidDeviceCatalog]
        attr_accessor :android_device_catalog
      
        # Supported network configurations
        # Corresponds to the JSON property `networkConfigurationCatalog`
        # @return [Google::Apis::TestingV1::NetworkConfigurationCatalog]
        attr_accessor :network_configuration_catalog
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_device_catalog = args[:android_device_catalog] if args.key?(:android_device_catalog)
          @network_configuration_catalog = args[:network_configuration_catalog] if args.key?(:network_configuration_catalog)
        end
      end
      
      # Specifies a single test to be executed in a single environment.
      class TestExecution
        include Google::Apis::Core::Hashable
      
        # The environment in which the test is run.
        # Corresponds to the JSON property `environment`
        # @return [Google::Apis::TestingV1::Environment]
        attr_accessor :environment
      
        # Unique id set by the backend.
        # @OutputOnly
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Id of the containing TestMatrix.
        # @OutputOnly
        # Corresponds to the JSON property `matrixId`
        # @return [String]
        attr_accessor :matrix_id
      
        # The cloud project that owns the test execution.
        # @OutputOnly
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Indicates the current progress of the test execution (e.g., FINISHED).
        # @OutputOnly
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Additional details about the progress of the running test.
        # Corresponds to the JSON property `testDetails`
        # @return [Google::Apis::TestingV1::TestDetails]
        attr_accessor :test_details
      
        # A description of how to run the test.
        # Corresponds to the JSON property `testSpecification`
        # @return [Google::Apis::TestingV1::TestSpecification]
        attr_accessor :test_specification
      
        # The time this test execution was initially created.
        # @OutputOnly
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # Represents a tool results step resource.
        # This has the results of a TestExecution.
        # Corresponds to the JSON property `toolResultsStep`
        # @return [Google::Apis::TestingV1::ToolResultsStep]
        attr_accessor :tool_results_step
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @environment = args[:environment] if args.key?(:environment)
          @id = args[:id] if args.key?(:id)
          @matrix_id = args[:matrix_id] if args.key?(:matrix_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @state = args[:state] if args.key?(:state)
          @test_details = args[:test_details] if args.key?(:test_details)
          @test_specification = args[:test_specification] if args.key?(:test_specification)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @tool_results_step = args[:tool_results_step] if args.key?(:tool_results_step)
        end
      end
      
      # A group of one or more TestExecutions, built by taking a
      # product of values over a pre-defined set of axes.
      class TestMatrix
        include Google::Apis::Core::Hashable
      
        # Information about the client which invoked the test.
        # Corresponds to the JSON property `clientInfo`
        # @return [Google::Apis::TestingV1::ClientInfo]
        attr_accessor :client_info
      
        # The matrix of environments in which the test is to be executed.
        # Corresponds to the JSON property `environmentMatrix`
        # @return [Google::Apis::TestingV1::EnvironmentMatrix]
        attr_accessor :environment_matrix
      
        # Describes why the matrix is considered invalid.
        # Only useful for matrices in the INVALID state.
        # @OutputOnly
        # Corresponds to the JSON property `invalidMatrixDetails`
        # @return [String]
        attr_accessor :invalid_matrix_details
      
        # The cloud project that owns the test matrix.
        # @OutputOnly
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Locations where the results of running the test are stored.
        # Corresponds to the JSON property `resultStorage`
        # @return [Google::Apis::TestingV1::ResultStorage]
        attr_accessor :result_storage
      
        # Indicates the current progress of the test matrix (e.g., FINISHED)
        # @OutputOnly
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The list of test executions that the service creates for this matrix.
        # @OutputOnly
        # Corresponds to the JSON property `testExecutions`
        # @return [Array<Google::Apis::TestingV1::TestExecution>]
        attr_accessor :test_executions
      
        # Unique id set by the service.
        # @OutputOnly
        # Corresponds to the JSON property `testMatrixId`
        # @return [String]
        attr_accessor :test_matrix_id
      
        # A description of how to run the test.
        # Corresponds to the JSON property `testSpecification`
        # @return [Google::Apis::TestingV1::TestSpecification]
        attr_accessor :test_specification
      
        # The time this test matrix was initially created.
        # @OutputOnly
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_info = args[:client_info] if args.key?(:client_info)
          @environment_matrix = args[:environment_matrix] if args.key?(:environment_matrix)
          @invalid_matrix_details = args[:invalid_matrix_details] if args.key?(:invalid_matrix_details)
          @project_id = args[:project_id] if args.key?(:project_id)
          @result_storage = args[:result_storage] if args.key?(:result_storage)
          @state = args[:state] if args.key?(:state)
          @test_executions = args[:test_executions] if args.key?(:test_executions)
          @test_matrix_id = args[:test_matrix_id] if args.key?(:test_matrix_id)
          @test_specification = args[:test_specification] if args.key?(:test_specification)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
        end
      end
      
      # A description of how to set up the device prior to running the test
      class TestSetup
        include Google::Apis::Core::Hashable
      
        # Identifies an account and how to log into it
        # Corresponds to the JSON property `account`
        # @return [Google::Apis::TestingV1::Account]
        attr_accessor :account
      
        # List of directories on the device to upload to GCS at the end of the test;
        # they must be absolute paths under /sdcard or /data/local/tmp.
        # Path names are restricted to characters a-z A-Z 0-9 _ - . + and /
        # Note: The paths /sdcard and /data will be made available and treated as
        # implicit path substitutions. E.g. if /sdcard on a particular device does
        # not map to external storage, the system will replace it with the external
        # storage path prefix for that device.
        # Optional
        # Corresponds to the JSON property `directoriesToPull`
        # @return [Array<String>]
        attr_accessor :directories_to_pull
      
        # Environment variables to set for the test (only applicable for
        # instrumentation tests).
        # Corresponds to the JSON property `environmentVariables`
        # @return [Array<Google::Apis::TestingV1::EnvironmentVariable>]
        attr_accessor :environment_variables
      
        # List of files to push to the device before starting the test.
        # Optional
        # Corresponds to the JSON property `filesToPush`
        # @return [Array<Google::Apis::TestingV1::DeviceFile>]
        attr_accessor :files_to_push
      
        # The network traffic profile used for running the test.
        # Optional
        # Corresponds to the JSON property `networkProfile`
        # @return [String]
        attr_accessor :network_profile
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account = args[:account] if args.key?(:account)
          @directories_to_pull = args[:directories_to_pull] if args.key?(:directories_to_pull)
          @environment_variables = args[:environment_variables] if args.key?(:environment_variables)
          @files_to_push = args[:files_to_push] if args.key?(:files_to_push)
          @network_profile = args[:network_profile] if args.key?(:network_profile)
        end
      end
      
      # A description of how to run the test.
      class TestSpecification
        include Google::Apis::Core::Hashable
      
        # A test of an Android application that can control an Android component
        # independently of its normal lifecycle.
        # Android instrumentation tests run an application APK and test APK inside the
        # same process on a virtual or physical AndroidDevice.  They also specify
        # a test runner class, such as com.google.GoogleTestRunner, which can vary
        # on the specific instrumentation framework chosen.
        # See <http://developer.android.com/tools/testing/testing_android.html> for
        # more information on types of Android tests.
        # Corresponds to the JSON property `androidInstrumentationTest`
        # @return [Google::Apis::TestingV1::AndroidInstrumentationTest]
        attr_accessor :android_instrumentation_test
      
        # A test of an android application that explores the application on a virtual
        # or physical Android Device, finding culprits and crashes as it goes.
        # Corresponds to the JSON property `androidRoboTest`
        # @return [Google::Apis::TestingV1::AndroidRoboTest]
        attr_accessor :android_robo_test
      
        # A test of an Android Application with a Test Loop.
        # The intent <intent-name> will be implicitly added, since Games is the only
        # user of this api, for the time being.
        # Corresponds to the JSON property `androidTestLoop`
        # @return [Google::Apis::TestingV1::AndroidTestLoop]
        attr_accessor :android_test_loop
      
        # Enables automatic Google account login.
        # If set, the service will automatically generate a Google test account and
        # add it to the device, before executing the test. Note that test accounts
        # might be reused.
        # Many applications show their full set of functionalities when an account is
        # present on the device. Logging into the device with these generated
        # accounts allows testing more functionalities.
        # Default is false.
        # Optional
        # Corresponds to the JSON property `autoGoogleLogin`
        # @return [Boolean]
        attr_accessor :auto_google_login
        alias_method :auto_google_login?, :auto_google_login
      
        # Disables performance metrics recording; may reduce test latency.
        # Corresponds to the JSON property `disablePerformanceMetrics`
        # @return [Boolean]
        attr_accessor :disable_performance_metrics
        alias_method :disable_performance_metrics?, :disable_performance_metrics
      
        # Disables video recording; may reduce test latency.
        # Corresponds to the JSON property `disableVideoRecording`
        # @return [Boolean]
        attr_accessor :disable_video_recording
        alias_method :disable_video_recording?, :disable_video_recording
      
        # A description of how to set up the device prior to running the test
        # Corresponds to the JSON property `testSetup`
        # @return [Google::Apis::TestingV1::TestSetup]
        attr_accessor :test_setup
      
        # Max time a test execution is allowed to run before it is
        # automatically cancelled.
        # Optional, default is 5 min.
        # Corresponds to the JSON property `testTimeout`
        # @return [String]
        attr_accessor :test_timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_instrumentation_test = args[:android_instrumentation_test] if args.key?(:android_instrumentation_test)
          @android_robo_test = args[:android_robo_test] if args.key?(:android_robo_test)
          @android_test_loop = args[:android_test_loop] if args.key?(:android_test_loop)
          @auto_google_login = args[:auto_google_login] if args.key?(:auto_google_login)
          @disable_performance_metrics = args[:disable_performance_metrics] if args.key?(:disable_performance_metrics)
          @disable_video_recording = args[:disable_video_recording] if args.key?(:disable_video_recording)
          @test_setup = args[:test_setup] if args.key?(:test_setup)
          @test_timeout = args[:test_timeout] if args.key?(:test_timeout)
        end
      end
      
      # Represents a tool results execution resource.
      # This has the results of a TestMatrix.
      class ToolResultsExecution
        include Google::Apis::Core::Hashable
      
        # A tool results execution ID.
        # @OutputOnly
        # Corresponds to the JSON property `executionId`
        # @return [String]
        attr_accessor :execution_id
      
        # A tool results history ID.
        # @OutputOnly
        # Corresponds to the JSON property `historyId`
        # @return [String]
        attr_accessor :history_id
      
        # The cloud project that owns the tool results execution.
        # @OutputOnly
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @execution_id = args[:execution_id] if args.key?(:execution_id)
          @history_id = args[:history_id] if args.key?(:history_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Represents a tool results history resource.
      class ToolResultsHistory
        include Google::Apis::Core::Hashable
      
        # A tool results history ID.
        # Required
        # Corresponds to the JSON property `historyId`
        # @return [String]
        attr_accessor :history_id
      
        # The cloud project that owns the tool results history.
        # Required
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @history_id = args[:history_id] if args.key?(:history_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Represents a tool results step resource.
      # This has the results of a TestExecution.
      class ToolResultsStep
        include Google::Apis::Core::Hashable
      
        # A tool results execution ID.
        # @OutputOnly
        # Corresponds to the JSON property `executionId`
        # @return [String]
        attr_accessor :execution_id
      
        # A tool results history ID.
        # @OutputOnly
        # Corresponds to the JSON property `historyId`
        # @return [String]
        attr_accessor :history_id
      
        # The cloud project that owns the tool results step.
        # @OutputOnly
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # A tool results step ID.
        # @OutputOnly
        # Corresponds to the JSON property `stepId`
        # @return [String]
        attr_accessor :step_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @execution_id = args[:execution_id] if args.key?(:execution_id)
          @history_id = args[:history_id] if args.key?(:history_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @step_id = args[:step_id] if args.key?(:step_id)
        end
      end
      
      # Network emulation parameters
      class TrafficRule
        include Google::Apis::Core::Hashable
      
        # Bandwidth in kbits/second
        # Corresponds to the JSON property `bandwidth`
        # @return [Float]
        attr_accessor :bandwidth
      
        # Burst size in kbits
        # Corresponds to the JSON property `burst`
        # @return [Float]
        attr_accessor :burst
      
        # Packet delay, must be >= 0
        # Corresponds to the JSON property `delay`
        # @return [String]
        attr_accessor :delay
      
        # Packet duplication ratio (0.0 - 1.0)
        # Corresponds to the JSON property `packetDuplicationRatio`
        # @return [Float]
        attr_accessor :packet_duplication_ratio
      
        # Packet loss ratio (0.0 - 1.0)
        # Corresponds to the JSON property `packetLossRatio`
        # @return [Float]
        attr_accessor :packet_loss_ratio
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bandwidth = args[:bandwidth] if args.key?(:bandwidth)
          @burst = args[:burst] if args.key?(:burst)
          @delay = args[:delay] if args.key?(:delay)
          @packet_duplication_ratio = args[:packet_duplication_ratio] if args.key?(:packet_duplication_ratio)
          @packet_loss_ratio = args[:packet_loss_ratio] if args.key?(:packet_loss_ratio)
        end
      end
    end
  end
end