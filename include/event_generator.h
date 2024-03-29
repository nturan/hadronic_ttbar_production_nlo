#pragma once
/*
	This file was written by Turan Nuraliyev.
	It includes implementation of the EventGenerator class.
	The EventGenerator class allows to generate unweighted LO
	or NLO events or read them from file. 

	nuraliyev.turan@gmail.com
*/

#include "cross_sections.h"
#include <string>
#include <vector>
#include <fstream>
#include <iostream>

typedef std::tuple<double, double, double, double, double, double> Event;
double LoMaxIntegrandFinderIntegral(
	std::map<std::string, double> v, 
	double& wgt,
	Parameters* p, 
	std::vector<Histogram*>* histograms, 
	double* max_integrand);

std::tuple<double, double, double> NloHadronic(
	std::map<std::string, double> v, 
	double& wgt,
	Parameters* p, 
	std::vector<Histogram*>* histograms, 
	Integral* nlo_integral);

class EventGenerator {
private:
	void GenerateLOEvents(unsigned int number, Parameters* p);
	void GenerateNLOEvents(unsigned int number, Parameters* p);
	std::vector<Event> events;
public:
	EventGenerator();
	EventGenerator(
		unsigned int number, 
		std::string perturbation_order, 
		Parameters* p);
	EventGenerator(std::string file_name);
	std::vector<Event> GetEvents();
	void Print();

};