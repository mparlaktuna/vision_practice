#pragma once

#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include "opencv2/imgproc.hpp"
#include "spdlog/spdlog.h"


template<>
struct fmt::formatter<cv::Mat>
{
  template<typename ParseContext>
  constexpr auto parse(ParseContext& ctx)
  {
      return ctx.begin();
  }

  template<typename FormatContext>
  auto format(const cv::Mat& img, FormatContext& ctx)
  {
    return fmt::format_to(ctx.out(), "Cols:{} Rows:{}", img.cols, img.rows);
  }
};
