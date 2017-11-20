#define _USE_MATH_DEFINES
#include <iostream>
#include <cmath>
#include <opencv2/opencv.hpp>
using namespace std;
using namespace cv;
string win_src = "src";
string win_dst = "dst";

int main(int argc, char **argv)
{
    string file_src = "src.png";
    string file_dst = "dst.png";
    Mat img_src = imread(file_src, 1);
    // Mat img_src = imread(file_src, 0);  // グレースケール

    Mat img_dst;
    if (!img_src.data) {
        cout << "error" << endl;
        return -1;
    }

    // ウィンドウの生成
    namedWindow(win_src, CV_WINDOW_AUTOSIZE);
    namedWindow(win_dst, CV_WINDOW_AUTOSIZE);

    flip(img_src, img_dst, 0);  // 水直反転

    imshow(win_src, img_src);
    imshow(win_dst, img_dst);
    imwrite(file_dst, img_dst);

    waitKey(0);
    return 0;
}

