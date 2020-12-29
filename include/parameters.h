#pragma once

#include "LHAPDF/LHAPDF.h"
#include <vector>
#include <map>
#include <string>
#include <functional>

const double kPbarn = 0.3893792323117611E+9;

class Parameters {
private:
	double ecms_, mur2_, muf2_, m_, alpha_s_, gs2_;
	LHAPDF::PDFSet lhapdfset;
	LHAPDF::PDF* lhapdf;
public:
	Parameters(std::string pdf_name);
	void InitializePartonDistributionFunctionSets(std::string pdf_name);
	std::map<std::string, std::function<double(double, double)>> Fs;
	double gg(double x1, double x2, double muf2);
	double qqb(double x1, double x2, double muf2);
	double qbq(double x1, double x2, double muf2);
	double gq(double x1, double x2, double muf2);
	double gqb(double x1, double x2, double muf2);
	double qg(double x1, double x2, double muf2);
	double qbg(double x1, double x2, double muf2);
	void SetColliderEnergy(double ecms);
	void SetRenormalizationScale(double mur);
	void SetFactorizationScale(double muf);
	void SetTopQuarkMass(double m);
	double GetColliderEnergy();
	double GetSquaredRenormalizationScale();
	double GetSquaredFactorizationScale();
	double GetTopQuarkMass();
	double GetAlphaS();
	double GetSquaredGs();
	std::vector<std::string> channels;
 };
