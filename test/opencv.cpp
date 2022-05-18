#include "gtest/gtest.h"
#include "tools.hpp"

using namespace cv;

TEST(SimpleOps, Opencv)
{
  Mat src = imread("lena.png", IMREAD_COLOR);
  Point2f srcTri[3];
  srcTri[0] = Point2f( 0.f, 0.f );
  srcTri[1] = Point2f( 0.f, 2.f );
  srcTri[2] = Point2f( 1.f, 0.f);
  
  Point2f dstTri[3];
  dstTri[0] = Point2f( 0.f, 100.f );
  dstTri[1] = Point2f( 0.f, 102.f );
  dstTri[2] = Point2f( 1.f, 100.f );

  Mat warp_mat = getAffineTransform( srcTri, dstTri );
  Mat warp_dst = Mat::zeros( src.rows, src.cols, src.type() );
  warpAffine( src, warp_dst, warp_mat, warp_dst.size() );
  
  imshow("Source", src);
  imshow("Warped", warp_dst);
  
  waitKey(2000); // Wait for a keystroke in the window
}

TEST(Resize, Opencv)
{
  Mat src = imread("lena.png", IMREAD_COLOR);
  
}

// resize with different interpolations
// 
