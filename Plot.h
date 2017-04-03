/*
 * Plot.h
 *
 *  Created on: Mar 28, 2017
 *      Author: alax
 */

#ifndef PLOT_H_
#define PLOT_H_

#undef GNUPLOT_ENABLE_PTY

#include <thread>
#include <mutex>

#include <atomic>
#include <deque>

#include "gnuplot-iostream.h"
#include "concurency_helpers.h"

#define maximum_count 512

class smooth_cpp
{
public:
	smooth_cpp();

	void set_filter_value(double input);

	double process(double input);

private:
	double filter;
	double smoothed;
};

class Plot
{
public:
	enum class transfer
	{
		block, scroll
	};

	Plot(char const * _name, double _scale_y_min, double _scale_y_max,
			transfer _metod);

	void update(double input);

	void upload(const std::array<double, 512> &input);

	bool proces();

private:

	char const *name;
	transfer metod;
	double scale_y_min, scale_y_max;

	std::thread *t;
	std::mutex m;
	std::atomic<double> value;

	Gnuplot gp;
	std::deque<double > plot;

	smooth_cpp smooth;

};




#endif /* PLOT_H_ */
