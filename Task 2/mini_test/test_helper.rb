# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::HtmlReporter.new(
  reports_dir: 'Task 2/test/reports/spec',
  color: true,
  mode: :clean
)


# ## 1. Spec Reporter (detailed output)
# Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new(
#   color: true,                # Enable colored output
#   slow_count: 5,             # Show 5 slowest tests
#   detailed_skip: true,       # Show detailed skip messages
#   slow_threshold: 5,         # Tests longer than 5s are marked slow
#   show_slow_tests: true      # Display slow tests in output
# )
#
# ## 2. Progress Reporter (dots)
# Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new(
#   detailed_skip: false,      # Don't show detailed skip info
#   color: true               # Enable colored output
# )
#
# ## 3. HTML Reporter
# Minitest::Reporters.use! Minitest::Reporters::HtmlReporter.new(
#   reports_dir: 'test/reports',
#   color: true,
#   mode: :clean            # Clean old reports before running
# )
#
# ## 4. Multiple Reporters
# Minitest::Reporters.use! [
#   Minitest::Reporters::SpecReporter.new,
#   Minitest::Reporters::HtmlReporter.new(reports_dir: 'test/reports'),
#   Minitest::Reporters::JUnitReporter.new('test/reports/junit')
# ]
#
# ## 5. Custom Reporter for Spec Style
# class CustomSpecReporter < Minitest::Reporters::SpecReporter
#   def record(test)
#     super
#     puts "\nTest: #{test.name}"
#     puts "Time: #{test.time}"
#     puts "Status: #{test.passed? ? 'PASS' : 'FAIL'}"
#     puts "------------------"
#   end
# end
#
# Minitest::Reporters.use! CustomSpecReporter.new

#
# ## 7. Mean Time Reporter (shows average test times)
# Minitest::Reporters.use! Minitest::Reporters::MeanTimeReporter.new(
#   previous_runs_filename: 'test_times.txt',
#   report_filename: 'test/reports/test_times.txt'
# )
